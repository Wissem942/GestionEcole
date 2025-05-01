<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View ;
//use App\Models\Eleve ;
use Illuminate\Http\RedirectResponse;   
use App\Http\Requests\EleveRequest; 
use App\Models\{Eleve, Classe};
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;

use Spatie\FlareClient\View as FlareClientView;

   
    class ElevesController extends Controller
{
    
    
        // public function index(): View
        // {
        //     //$eleves = Eleve::all();
        //    // $eleves=Eleve::paginate(5);
        //    $eleves = Eleve::oldest('nom')->paginate(5);
        //     return view('index', compact('eleves'));
        // }

        public function index($slug = null): View
{
    $query = $slug ? Classe::whereSlug($slug)->firstOrFail()->eleves() : Eleve::query();
    $eleves = $query->paginate(6);
    $classes = Classe::all();
    return view('index', compact('eleves', 'classes', 'slug'));
}
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {   
        $classes = Classe::all();
        return view('create', compact('classes'));
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(EleveRequest $eleveRequest): RedirectResponse
    {   
        $eleve= new Eleve() ;
        $eleve->nom =$eleveRequest->input('nom') ;
        $eleve->prenom =$eleveRequest->input('prenom') ;
        $eleve->dateNaiss =$eleveRequest->input('dateNaiss') ;
        $eleve->email =$eleveRequest->input('email') ;
             
        $eleveRequest->file("image")->getPathname();
        $imageName=time().'.'.$eleveRequest->image->extension();
        $eleveRequest->image->move(public_path('photos'), $imageName);
        $eleve->image=$imageName ;
        $eleve->classe_id=$eleveRequest->input('classe_id') ;
         
        //Eleve::create($eleveRequest->all());
        $eleve->save() ;
        return redirect()->route('eleves.index')->with('info', "L'élève a bien été créé");
}  
    /**
     * Display the specified resource.
     */
    public function show(Eleve $elefe ) : View
    {
        return view ("show", compact('elefe')) ;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Eleve $elefe):View
    {
        
    return view('edit', compact('elefe'));
    }


    

    /**
     * Update the specified resource in storage.
     */
    public function update(EleveRequest $eleveRequest, Eleve $elefe): RedirectResponse
    {
        $eleveRequest->file("image")->getPathname();
        $imageName=time().'.'.$eleveRequest->image->extension();
        $eleveRequest->image->move(public_path('photos'), $imageName);
      
        $elefe->nom = $eleveRequest->input('nom');
        $elefe->prenom = $eleveRequest->input('prenom');
        $elefe->dateNaiss = $eleveRequest->input('dateNaiss');
        $elefe->email = $eleveRequest->input('email');
        $elefe->image = $imageName;
        $elefe->save();


      // $elefe->update($eleveRequest->all());
        return redirect()->route('eleves.index')->with('info', "L'élève a bien été modifié");
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Eleve $elefe) : RedirectResponse
    {
        $elefe->delete() ;
        return back()->with('info', "l'élève a été supprimé");
    }

    public function creerPDF(){
        //$eleves = Eleve::all();
        $eleves =DB::table("eleves")
        ->join("classes","classe_id","=","classes.id")    
        ->select("eleves.*", "classes.slug")
        ->orderBy('nom')
        ->get() ;  
     
            $data = [
                'titre' => 'Liste des élèves',
                'date' => date("d/m/y") ,
                'eleves'=>$eleves 
              ];
          
        $pdf = PDF::loadView('pdf', $data);
        return $pdf->download('eleve_pdf.pdf');
    }
}
