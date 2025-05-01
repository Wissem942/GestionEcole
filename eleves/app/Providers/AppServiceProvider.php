<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator ;
use Illuminate\Support\Facades\View;
use App\Models\Classe;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
  
        Paginator::useBootstrap();
        $classes = Classe::all(); // Ici nous sélectionnons toutes les classes
        View::share('classes', $classes); // Nous partagons le contenu de la variable $classes avec toutes les vues

    }
}
