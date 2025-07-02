using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenMobileApp;

public partial class Exercicederespiration478Page : ContentPage
{
    private readonly ActivityMetadataService _activityMetaService;
    public Exercicederespiration478Page()
	{
		InitializeComponent();
        _activityMetaService = new ActivityMetadataService();
    }

    private async void OnStartClicked(object sender, EventArgs e)
    {
        // Inspire 4 secondes (bulle qui gonfle)
        await BreathBubble.ScaleTo(2, 4000, Easing.CubicIn);

        // Retiens 7 secondes (pause)
        await Task.Delay(7000);

        // Expire 8 secondes (bulle qui rétrécit)
        await BreathBubble.ScaleTo(1, 8000, Easing.CubicOut);
    }

    private async void OnFinishClicked(object sender, EventArgs e)
    {
        var now = DateTime.Now;
        string nomActivite = $"{now:yyyy-MM-dd HH:mm:ss} - Exercice de respiration 4-7-8";

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