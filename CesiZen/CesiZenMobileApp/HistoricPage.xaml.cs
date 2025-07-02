using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using System.Diagnostics;

namespace CesiZenMobileApp;

public partial class HistoricPage : ContentPage
{
    private readonly ActivityMetadataService _activiteMetaService;
    private int _lastLoadedUserId = -1;

    public HistoricPage()
    {
        InitializeComponent();
        _activiteMetaService = new ActivityMetadataService();
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        var currentUserId = Preferences.Get("UserId", 0);

        if (currentUserId != _lastLoadedUserId)
        {
            _lastLoadedUserId = currentUserId;
            LoadActivitesMetadata();
        }
    }

    private async void LoadActivitesMetadata()
    {
        var idUser = Preferences.Get("UserId", 0);
        var activites = await _activiteMetaService.GetActivitesMetadataAsyncById(idUser);

        if (activites != null)
        {
            ActiviteHistoricListView.ItemsSource = activites
                .OrderByDescending(a => a.DatePubli)
                .ToList();
        }
        else
        {
            await DisplayAlert("Erreur", "Impossible de charger les activités.", "OK");
        }
    }

    public void UpdateConnexionAndAccountVisibility()
    {
        var idUser = Preferences.Get("UserId", 0);
        Debug.WriteLine($"userId : {idUser}");

        if (idUser != _lastLoadedUserId)
        {
            _lastLoadedUserId = idUser;
            LoadActivitesMetadata();
        }
    }
}
