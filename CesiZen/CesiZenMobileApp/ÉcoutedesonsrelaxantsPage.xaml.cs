using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenMobileApp;

public partial class ÉcoutedesonsrelaxantsPage : ContentPage
{
    private readonly ActivityMetadataService _activityMetaService;
    public ÉcoutedesonsrelaxantsPage()
	{
		InitializeComponent();
        _activityMetaService = new ActivityMetadataService();
    }

    private async void OnFinishClicked(object sender, EventArgs e)
    {
        var now = DateTime.Now;
        string nomActivite = $"{now:yyyy-MM-dd HH:mm:ss} - Ecoute de sons relaxans";

        var activityMeta = new ActiviteMetadata
        {
            Nom = nomActivite,
            DatePubli = now,
            UtilisateurId = Preferences.Get("UserId", 0),
            ActiviteId = 18 // Par défaut, rôle de l'utilisateur
        };

        var response = await _activityMetaService.PostActivityMetadataAsync(activityMeta);


        if (response)
        {
            (Application.Current.MainPage as HistoricPage)?.UpdateConnexionAndAccountVisibility();
            await Shell.Current.GoToAsync("//ActivityPage");
        }
        else
        {
            MessageLabel.Text = "Erreur lors de l'inscription. Veuillez réessayer.";
            MessageLabel.IsVisible = true;
        }
    }
}