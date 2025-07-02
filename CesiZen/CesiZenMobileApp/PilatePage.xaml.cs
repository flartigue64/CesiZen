using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenMobileApp;

public partial class PilatePage : ContentPage
{
    private readonly ActivityMetadataService _activityMetaService;
    public PilatePage()
	{
		InitializeComponent();
        _activityMetaService = new ActivityMetadataService();
    }

    private async void OnFinishClicked(object sender, EventArgs e)
    {
        var now = DateTime.Now;
        string nomActivite = $"{now:yyyy-MM-dd HH:mm:ss} - Pilate";

        var activityMeta = new ActiviteMetadata
        {
            Nom = nomActivite,
            DatePubli = now,
            UtilisateurId = Preferences.Get("UserId", 0),
            ActiviteId = 18 // Par d�faut, r�le de l'utilisateur
        };

        var response = await _activityMetaService.PostActivityMetadataAsync(activityMeta);

        if (response)
        {
            (Application.Current.MainPage as HistoricPage)?.UpdateConnexionAndAccountVisibility();
            await Shell.Current.GoToAsync("//ActivityPage");
        }
        else
        {
            MessageLabel.Text = "Erreur lors de l'inscription. Veuillez r�essayer.";
            MessageLabel.IsVisible = true;
        }
    }
}