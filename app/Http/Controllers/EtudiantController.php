<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View ;

class EtudiantController extends Controller
{
    public function show($n): View{
        return view("etudiant")->with('numero', $n) ;
    }
}
