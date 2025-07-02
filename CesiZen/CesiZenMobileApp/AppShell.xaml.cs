namespace CesiZenMobileApp
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute("RegisterPage", typeof(RegisterPage));
            Routing.RegisterRoute("ModifyPasswordPage", typeof(ModifyPasswordPage));
            Routing.RegisterRoute("articledetail", typeof(ArticleDetailPage));

            var email = Preferences.Get("UserEmail", string.Empty);

            // Masque le lien Connexion si l'utilisateur est déjà connecté
            ConnexionFlyout.IsVisible = string.IsNullOrEmpty(email);
            AccountFlyout.IsVisible = !string.IsNullOrEmpty(email);
            HistoricFlyout.IsVisible = !string.IsNullOrEmpty(email);
        }

        public void UpdateConnexionAndAccountVisibility()
        {
            var email = Preferences.Get("UserEmail", string.Empty);
            ConnexionFlyout.IsVisible = string.IsNullOrEmpty(email);
            AccountFlyout.IsVisible = !string.IsNullOrEmpty(email);
            HistoricFlyout.IsVisible = !string.IsNullOrEmpty(email);
        }



    }
}
