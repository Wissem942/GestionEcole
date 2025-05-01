-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 01 mai 2025 à 20:09
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`id`, `libelle`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'BTS SIO 1 A', 'SIO1A', NULL, NULL),
(2, 'BTS SIO 1 B', 'SIO1B', NULL, NULL),
(3, 'BTS SIO 2 SLAM', 'SIO2SLAM', NULL, NULL),
(4, 'BTS SIO 2 SISR', 'SIO2SISR', NULL, NULL),
(5, 'BTS CG', 'CG', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `classe_prof`
--

CREATE TABLE `classe_prof` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `classe_id` bigint UNSIGNED NOT NULL,
  `prof_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe_prof`
--

INSERT INTO `classe_prof` (`id`, `created_at`, `updated_at`, `classe_id`, `prof_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 2, 1),
(3, NULL, NULL, 4, 5),
(4, NULL, NULL, 2, 6),
(5, NULL, NULL, 3, 2),
(6, NULL, NULL, 3, 1),
(7, NULL, NULL, 3, 8),
(8, NULL, NULL, 3, 3),
(9, NULL, NULL, 4, 6),
(10, NULL, NULL, 2, 2),
(11, NULL, NULL, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNaiss` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `classe_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id`, `nom`, `prenom`, `image`, `dateNaiss`, `email`, `created_at`, `updated_at`, `classe_id`) VALUES
(1, 'BAYECH', 'Khalil', 'bayech.png', '2004-09-04', 'bayech.kha@gmail.com', NULL, NULL, 3),
(2, 'BELAIDOUNI', 'Adam', 'belaidouni.png', '2005-02-22', 'adam.bela@gmail.com', NULL, NULL, 3),
(3, 'BENAZZOUZ', 'Anas', 'benazzouz.png', '2001-07-16', 'anas.ben@monycee.net', NULL, NULL, 3),
(4, 'BOUKHALFA', 'Kaci', 'boukhalfa.png', '2002-05-18', 'b.k@gmail.com', NULL, NULL, 3),
(5, 'CALIXTE', 'Anel', 'calixte.png', '2004-07-25', 'a.c@gmail.com', NULL, NULL, 3),
(6, 'CERVEAU', 'Joshua', 'cerveau.png', '2005-06-25', 'c.J@gmail.com', NULL, NULL, 3),
(7, 'DE-OLIVEIRA GIBERT', 'Victor', 'de_oliveira.png', '2004-03-18', 'd.v@gmail.com', NULL, NULL, 3),
(8, 'EL JAYI', 'Amine', 'el_jayi.png', '2003-05-19', 'e.J@gmail.com', NULL, NULL, 3),
(9, 'ELANTAREY', 'Sammy', 'elantarey.png', '2004-12-21', 'el.sam@gmail.com', NULL, NULL, 3),
(10, 'FERNANDES', 'Nolwen', 'fernades.png', '2004-12-12', 'f.n@gmail.com', NULL, NULL, 3),
(11, 'FOURTINE', 'Baptiste', 'fourtine.png', '2003-10-01', 'f.b@gmail.com', NULL, NULL, 3),
(12, 'GUILLOU', 'Vianney', 'guillou.png', '2005-06-13', 'g.v@gmail.com', NULL, NULL, 3),
(13, 'LAMARRE', 'Jade', 'lamarre.png', '2005-09-06', 'l.jade@gmail.com', NULL, NULL, 3),
(14, 'LAVERY', 'Leeyah', 'lavery.png', '2005-06-25', 'lavery.l@gmail.com', NULL, NULL, 3),
(15, 'LOUET', 'Florent', 'louet.png', '2004-11-07', 'florent.louet@gmail.com', NULL, NULL, 3),
(16, 'MINOT', 'Bastien', 'minot.png', '2002-06-30', 'minot.bastien@gmail.com', NULL, NULL, 3),
(17, 'NGUYEN', 'Emrys', 'nguyen.png', '2006-04-14', 'Em.ng@gmail.com', NULL, NULL, 3),
(18, 'RAKOTONDRAVONY', 'Kiadiniaina', 'rakotondravon.png', '2005-02-11', 'rak.kia@gmail.com', NULL, NULL, 3),
(19, 'RAMSSAMY', 'Yanis', 'ramsammy.png', '2000-07-03', 'ram.yanis@gmail.com', NULL, NULL, 3),
(20, 'RANDON', 'Adeline', 'randon.png', '2003-07-25', 'randon.adeline@gmail.com', NULL, NULL, 3),
(21, 'REZGUI', 'Wissem', 'rezgui.png', '2005-11-13', 'wissem.rezgui@gmail.com', NULL, NULL, 3),
(22, 'ROULET', 'Archibald', 'roulet.png', '2003-09-09', 'roulet.arch@gmail.com', NULL, NULL, 3),
(23, 'SALVADOR', 'Anne-Caroline', 'salvador.png', '2005-10-11', 'ac.s@gmail.com', NULL, NULL, 3),
(24, 'YAYAOUI', 'Yanis', 'yahiaoui.png', '2003-08-18', 'y.ya@gmail.com', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_14_144805_create_eleves_table', 1),
(6, '2024_12_19_081655_create_classes_table', 1),
(7, '2025_01_08_180943_create_profs_table', 1),
(8, '2025_01_08_181326_create_classe_prof_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profs`
--

CREATE TABLE `profs` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matiere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profs`
--

INSERT INTO `profs` (`id`, `created_at`, `updated_at`, `nom`, `prenom`, `matiere`) VALUES
(1, NULL, NULL, 'Gibert', 'Stéphanie', 'informatique'),
(2, NULL, NULL, 'Hamidou', 'Salim', 'informatique'),
(3, NULL, NULL, 'Riesner', 'Christian', 'informatique'),
(4, NULL, NULL, 'Nabli', 'Hafedh', 'informatique'),
(5, NULL, NULL, 'Benmidhane', 'Moustapha', 'informatique'),
(6, NULL, NULL, 'Freard', 'Simon', 'maths'),
(7, NULL, NULL, 'Laperche', 'Paul', 'anglais'),
(8, NULL, NULL, 'Denize', 'Thomas', 'Eco-droit'),
(9, '2025-03-02 18:05:37', '2025-03-02 18:05:37', 'Denize', 'Thomas', 'CEJM'),
(10, '2025-03-02 18:09:12', '2025-03-02 18:09:12', 'Kaido', 'Yonko', 'Dragon');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classes_libelle_unique` (`libelle`),
  ADD UNIQUE KEY `classes_slug_unique` (`slug`);

--
-- Index pour la table `classe_prof`
--
ALTER TABLE `classe_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classe_prof_classe_id_foreign` (`classe_id`),
  ADD KEY `classe_prof_prof_id_foreign` (`prof_id`);

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eleves_classe_id_foreign` (`classe_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `classe_prof`
--
ALTER TABLE `classe_prof`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profs`
--
ALTER TABLE `profs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe_prof`
--
ALTER TABLE `classe_prof`
  ADD CONSTRAINT `classe_prof_classe_id_foreign` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classe_prof_prof_id_foreign` FOREIGN KEY (`prof_id`) REFERENCES `profs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_classe_id_foreign` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
