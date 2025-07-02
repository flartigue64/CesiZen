using System.Collections.ObjectModel;
using System.Diagnostics;
using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;

namespace CesiZenMobileApp;

public partial class ArticlePage : ContentPage
{

    private readonly ArticleService _articleService;
    public ObservableCollection<ArticleDto> Articles { get; set; } = new();
    public ArticlePage()
	{
		InitializeComponent();
        _articleService = new ArticleService();
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await LoadArticles();
    }

    private async Task LoadArticles()
    {
        var articles = await _articleService.GetAllArticlesAsync();
        if (articles != null)
        {
            ArticleListView.ItemsSource = articles;
        }
        else
        {
            await DisplayAlert("Erreur", "Impossible de charger les articles.", "OK");
        }
    }

    private async void OnViewArticleClicked(object sender, EventArgs e)
    {
        Debug.WriteLine("Article clicked");

        if (sender is Element element && element is VisualElement visualElement)
        {
            var gesture = (TapGestureRecognizer)((Frame)visualElement).GestureRecognizers[0];
            var parameter = gesture.CommandParameter?.ToString();

            if (int.TryParse(parameter, out int articleId))
            {
                Debug.WriteLine("Article clicked2");
                await Shell.Current.GoToAsync($"articledetail?id={articleId}");
            }
            else
            {
                Debug.WriteLine("CommandParameter is not a valid int");
            }
        }
    }

}