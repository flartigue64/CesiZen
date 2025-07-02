using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using System.Diagnostics;

namespace CesiZenMobileApp
{
    public partial class ActivityPage : ContentPage
    {
        private readonly ActiviteService _activiteService;

        public ActivityPage()
        {
            InitializeComponent();
            _activiteService = new ActiviteService();
            LoadActivites();
        }

        private async void LoadActivites()
        {
            var activites = await _activiteService.GetActivitesAsync();
            if (activites != null)
            {
                ActiviteListView.ItemsSource = activites;
            }
            else
            {
                await DisplayAlert("Erreur", "Impossible de charger les activités.", "OK");
            }
        }

        private async void OnActivityTapped(object sender, TappedEventArgs e)
        {
            if (Preferences.Get("UserEmail", string.Empty) != "")
            {
                if (sender is Frame frame && frame.BindingContext is ActiviteDto activite)
                {
                    string pageKey = activite.Nom.Replace(" ", string.Empty); // Nom tout attaché
                    string fullPageName = $"CesiZenMobileApp.{pageKey}Page";

                    try
                    {
                        var pageType = Type.GetType(fullPageName);

                        if (pageType != null && Activator.CreateInstance(pageType) is Page page)
                        {
                            await Navigation.PushAsync(page);
                        }
                        else
                        {
                            await DisplayAlert("Erreur", $"Page '{pageKey}Page' introuvable.", "OK");
                        }
                    }
                    catch (Exception ex)
                    {
                        Debug.WriteLine($"Erreur navigation : {ex}");
                        await DisplayAlert("Erreur", "Une erreur est survenue lors de la navigation.", "OK");
                    }
                }
            }
        }
    }
}
