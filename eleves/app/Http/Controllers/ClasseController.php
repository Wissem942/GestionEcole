<?php

namespace App\Http\Controllers;
use App\Models\Classe ;
use Illuminate\Http\Request;

class ClasseController extends Controller
{
    public function AfficherClasse(Classe $classe)
    {
        $classe->with('profs')->get();
    
        $classes=Classe::paginate(3);
        return view('classe', compact('classes'));
    }
}
