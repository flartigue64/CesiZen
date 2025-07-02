using System.Diagnostics;
using CesiZenApp.Services;

namespace CesiZenMobileApp;

public partial class MainPage : ContentPage
{
    private readonly ActiviteService _service;

    public MainPage()
    {
        InitializeComponent();

        _service = new ActiviteService();
        LoadActivites();

        
    }

    private async void LoadActivites()
    {
        var activites = await _service.GetActivitesAsync();
        if (activites != null && activites.Any())
        {
            Debug.WriteLine($"Activités récupérées : {activites.Count}");
        }
        else
        {
            Debug.WriteLine("Aucune activité trouvée ou échec de récupération.");
            await DisplayAlert("Erreur", "Impossible de charger les activités", "OK");
        }
    }

    private async void OnActivitiesButtonClicked(object sender, EventArgs e)
    {
        // Navigue vers la page ActivityPage
        await Shell.Current.GoToAsync("//ActivityPage");
    }


}
