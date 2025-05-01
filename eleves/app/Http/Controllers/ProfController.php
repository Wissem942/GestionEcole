<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfRequest;
use Illuminate\Http\RedirectResponse;
 
use Illuminate\Http\Request;
//use App\Models\Prof ;
use App\Models\{Classe, Prof};

class ProfController extends Controller
{
    /**
     * Display a listing of the res ource.
     */
    public function index(Prof $prof)
    {
        $prof->with('classes')->get();
        $profs=Prof::orderBy('nom', 'asc')->paginate(3);
        return view('professeur', compact('profs'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function createProf()
    {
       
    }
 
    /**
     * Store a newly created resource in storage.
     */
    public function store(ProfRequest $profRequest): RedirectResponse
    {
        $prof = Prof::create($profRequest->all());
               
        $heures=$profRequest->nbHeures ;
        $classes=$profRequest->classe_id ;
        $taille=count($heures) ;
        // dd($classes) ;
        $tab_heures = [];
        for($i = 0; $i < $taille; $i++){
           $tab_heures[$classes[$i]] = ['nbHeures' => $heures[$i]];
        }
        //dd($tab_heures) ;
       $prof->classes()->attach($tab_heures);
        return redirect()->route('profs.index')->with('info', 'Le prof a bien été créé');
    }
    
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
 
    public function destroy(Prof $prof) : RedirectResponse
    {
        $prof->delete() ;
        return back()->with('info', "le prof a été supprimé");
    }
    public function unProf(){
		$unProf = Prof::find(3);
        return View('unProf', compact('unProf')); 
      

}
}
