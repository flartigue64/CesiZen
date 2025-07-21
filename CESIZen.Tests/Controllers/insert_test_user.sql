-- Exemple d'insertion dans AspNetUsers
INSERT INTO AspNetUsers
(Id, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed,
 PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed,
 TwoFactorEnabled, LockoutEnabled, AccessFailedCount, Nom, Prenom, Statut)
VALUES
(1, 'testuser', 'TESTUSER', 'testuser@example.com', 'TESTUSER@EXAMPLE.COM', 1,
 'AQAAAAEAACcQAAAAEExampleHashHere==', NEWID(), NEWID(), NULL, 0,
 0, 0, 0, 'Dupont', 'Jean', 'Actif');
