using System.Web;
using Microsoft.Maui.Controls;

namespace CesiZenMobileApp;

[QueryProperty(nameof(ArticleId), "id")]
public partial class ArticleDetailPage : ContentPage
{
    private readonly ArticleService _articleService = new();
    public int ArticleId { get; set; }

    public ArticleDetailPage()
	{
		InitializeComponent();
	}

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        var article = await _articleService.GetArticleAsync(ArticleId);
        if (article != null)
        {
            TitleLabel.Text = article.Titre;
            ContentLabel.Text = HttpUtility.HtmlDecode(article.Contenu); // décode le HTML

            // Affiche le bouton "Modifier" seulement si RoleId == 2
            var roleId = Preferences.Get("RoleId", 0);

            // Optionnel : tu peux stocker ces infos
            Preferences.Set("ArticleId", article.Id);
            Preferences.Set("ArticleTitre", article.Titre);
        }
        else
        {
            await DisplayAlert("Erreur", "Impossible de charger l'article.", "OK");
            await Shell.Current.GoToAsync("..");
        }
    }

    private async void OnBackClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync("..");
    }
}