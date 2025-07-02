using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using Microsoft.Maui.Storage;

namespace CesiZenMobileApp.ViewModels
{
    public class ActivityViewModel : INotifyPropertyChanged
    {
        private readonly ActiviteService _activiteService;

        public ObservableCollection<ActiviteDto> Activites { get; set; } = new();
        private bool _isUserLoggedIn;

        public bool IsUserLoggedIn
        {
            get => _isUserLoggedIn;
            set
            {
                _isUserLoggedIn = value;
                OnPropertyChanged();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public ActivityViewModel()
        {
            _activiteService = new ActiviteService();
            LoadLoginState();
            LoadActivites();
        }

        private void LoadLoginState()
        {
            var email = Preferences.Get("UserEmail", string.Empty);
            IsUserLoggedIn = !string.IsNullOrEmpty(email);
        }

        private async void LoadActivites()
        {
            var activites = await _activiteService.GetActivitesAsync();
            if (activites != null)
            {
                Activites.Clear();
                foreach (var a in activites)
                    Activites.Add(a);
            }
        }

        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}
