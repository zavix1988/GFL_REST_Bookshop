-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 08 2019 г., 07:09
-- Версия сервера: 5.7.20-log
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user12`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ashop_brands`
--

CREATE TABLE `ashop_brands` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ashop_brands`
--

INSERT INTO `ashop_brands` (`id`, `name`) VALUES
(1, 'Ford'),
(2, 'Toyota'),
(3, 'Audi'),
(4, 'Skoda'),
(5, 'ВАЗ');

-- --------------------------------------------------------

--
-- Структура таблицы `ashop_cars`
--

CREATE TABLE `ashop_cars` (
  `id` int(10) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `model` varchar(60) NOT NULL,
  `year` int(10) NOT NULL,
  `displacement` float NOT NULL,
  `color` varchar(60) NOT NULL,
  `max_speed` int(10) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ashop_cars`
--

INSERT INTO `ashop_cars` (`id`, `brand_id`, `model`, `year`, `displacement`, `color`, `max_speed`, `price`) VALUES
(1, 1, 'Fiesta', 2008, 1.25, 'green', 170, 5200),
(2, 1, 'Focus', 2010, 1.9, 'blue', 185, 7600),
(3, 2, 'Corolla', 2011, 1.6, 'black', 190, 11900),
(4, 4, 'Octavia', 2001, 1.6, 'grey', 180, 5100),
(5, 1, 'Mondeo', 2008, 2.5, 'black', 230, 11500);

-- --------------------------------------------------------

--
-- Структура таблицы `ashop_orders`
--

CREATE TABLE `ashop_orders` (
  `id` int(10) NOT NULL,
  `car_id` int(10) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `payment` enum('cash','credit_card') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ashop_orders`
--

INSERT INTO `ashop_orders` (`id`, `car_id`, `first_name`, `last_name`, `payment`) VALUES
(1, 1, 'Alex', 'Zhukov', 'credit_card'),
(2, 4, 'Evgen', 'Batikov', 'cash'),
(3, 2, 'Darth', 'Vader', 'credit_card'),
(4, 2, 'Жуков', 'Алексей', 'credit_card');

-- --------------------------------------------------------

--
-- Структура таблицы `ashop_users`
--

CREATE TABLE `ashop_users` (
  `id` int(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ashop_users`
--

INSERT INTO `ashop_users` (`id`, `login`, `password`, `first_name`, `last_name`, `email`, `token`) VALUES
(1, 'zavix', '$2y$10$Powxf.CwMwZxMVugYJ740uS/or.xGoGHUHugIBpRv.9tWon63sE0m', 'Alex', 'Zhukov', 'zavix1988@mksat.net', '1c982783e54e64ea3a4fbba0e55d1350'),
(2, 'zavix1', '$2y$10$anG0hlPQGZvIORrxv67w4eolatRSMgzLIa8BiHonm1ZQNBScdkCp2', 'Alex', 'Zhukov', 'zavix1988@mksat.net', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_authors`
--

CREATE TABLE `bookshop_authors` (
  `id` int(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `biography` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_authors`
--

INSERT INTO `bookshop_authors` (`id`, `first_name`, `last_name`, `biography`, `photo`, `slug`) VALUES
(1, 'Джоан', 'Роулинг', 'О писательнице Джоан Роулинг не слышал разве, что глухой. Каждый выход ее новой книги о юном волшебнике Гарри Поттере – вызывает небывалый ажиотаж, бьет все установленные ранее рекорды по продажам в литературном мире, а саму писательницу поднимает все выше и выше в рейтингах самых богатых людей то Британии, то мира. Но оставаться по долгу в таких «хит-парадах» на первых строчках Джоан не позволяют ее моральные принципы. Львиную долю своих гонораров Роулинг жертвует в различные благотворительные фонды. Она прекрасно помнит время, когда жила на грани бедности и отчаяния…', '', ''),
(2, 'Валерій', 'Ананьев', 'У 2015 році Валерій почав писати книгу. На війні не було можливості повноцінно займатися цим. Після звільнення, було декілька спроб продовжити роботу, але проблеми зі здоров\'ям заважали. І тільки після пішої подорожі Валерій зміг закінчити книгу про війну на Донбасі «Сліди на дорозі». Процес написання був для автора важким. На початку лютого 2018 року рукопис було завершено і почалась підготовка до друку.\r\n\r\nПісля декількох зустрічей з представниками різних видавництв, у тому числі з монополістами українського книжкового ринку, які хотіли надрукувати його книгу, Валерій був категорично проти співпраці з будь-ким. Він оформив себе, як видавця і заручившись підтримкою близьких друзів, надрукував її. 13 серпня 2018 року книга надійшла у продаж та одразу стала бестселером. За перші три тижні було розкуплено увесь 5-ти тисячний тираж, що є величезним успіхом для українського книжкового ринку. З вересня розпочався всеукраїнський тур автора на підтримку своєї книжки.\r\n\r\nОглядач сайту mrpl.city Іван Синєпалов розташував роман на 10 місці у переліку найкращих книжок, виданих українською мовою у 2018 році. На його думку, «З поправкою на епоху, „Сліди на дорозі“ цілком можна сприйняти за запізніле продовження „Холодного Яру“ — той самий художньо-документальний стиль і та сама здатність на кількох сторінках так прив\'язати читача до співслужбовців автора, що кожна смерть стає і твоєю особистою маленькою втратою».', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_books`
--

CREATE TABLE `bookshop_books` (
  `id` int(25) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(25) NOT NULL,
  `pubyear` int(10) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `pic` varchar(100) NOT NULL,
  `discount_id` int(25) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `lang` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_books`
--

INSERT INTO `bookshop_books` (`id`, `name`, `price`, `pubyear`, `isbn`, `description`, `pic`, `discount_id`, `slug`, `lang`) VALUES
(1, 'Гаррі Поттер колекція (комплект із 7 книг)', 1099, 2016, '978-966-7047-39-9, 978-966-7047-36-8, 978-966-7047-34-4, 978-966-7047-40-5, 978-966-7047-42-9, 978-966-7047-29-0, 978-966-7047-70-2', 'Історія хлопця-сироти, який дізнається про існування паралельного світу, в якому йому вже давно заброньовано одне з визначальних місць, де на нього чекають відчайдушні і віддані друзі та найлютіші вороги і підступні злодії. З моменту виходу першої книги про Гаррі Поттера немає жодної дитини, яка б не прагнула вчитися в Гріффіндорі та грати за їх команду в квіддіч. Книга, рекламувати яку було б зайвим. Немає жодного сумніву, що цикл пригод хлопчика-чаклуна та його друзів варто вивчати в шкільній програмі із зарубіжної літератури, а серйозні дослідження і дисертації на його грунті існують вже сьогодні. «Гаррі Поттер. Повна колекція (комплект із 7 книг)» — тепер придбати повне зібрання можна одним замовленням. Яскраві обкладинки, якісний друк  і прекрасний переклад від видавництва «А-ба-ба-га-ла-ма-га» — чудовий подарунок шанувальникам творчості Джоан Роулінг та літературного українського перекладу.', 'img/main2_4.jpg', 1, 'garry-potter-collection', 'UKR'),
(2, 'Сліди на дорозі', 219, 2018, '978-966-194-302-4', 'Унікальна жива книга! Перша жива книга про війну на Сході України. Ти, шановний читачу, відчуєш, як у твоє БМД влучає РПГ, ти будеш намагатися допомогти пораненому товаришу, ти відчуєш атмосферу напруги, знаходячись в оточенні, ти будеш читати справжній лист дівчини своєму коханому на фронт. І для цього тобі потрібна лише книга «Сліди на дорозі» та смартфон. Близько 100 QR кодів розставлені по тексту, дозволять вам поринути у події, описані в книзі. Ви зможете побачити на своєму смартфоні оригінальні відео та фотоматеріали реальних подій, що описані в книзі. Жодної постанови, увесь матеріал був знятий на фронті в 2014 році. Пориньте у життя головного героя з головою, відчуйте книгу своєю душею.', '', 1, 'slidy-na-dorozi', 'UKR');

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_books_authors`
--

CREATE TABLE `bookshop_books_authors` (
  `book_id` int(25) NOT NULL,
  `author_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_books_authors`
--

INSERT INTO `bookshop_books_authors` (`book_id`, `author_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_books_carts`
--

CREATE TABLE `bookshop_books_carts` (
  `book_id` int(25) NOT NULL,
  `cart_id` int(25) NOT NULL,
  `count` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_books_genres`
--

CREATE TABLE `bookshop_books_genres` (
  `book_id` int(25) NOT NULL,
  `genre_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_books_genres`
--

INSERT INTO `bookshop_books_genres` (`book_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_books_orders`
--

CREATE TABLE `bookshop_books_orders` (
  `book_id` int(25) NOT NULL,
  `order_id` int(25) NOT NULL,
  `count` int(25) NOT NULL,
  `price_with_discount` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_carts`
--

CREATE TABLE `bookshop_carts` (
  `id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `status_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_cart_statuses`
--

CREATE TABLE `bookshop_cart_statuses` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_deliveries`
--

CREATE TABLE `bookshop_deliveries` (
  `id` int(25) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_discounts`
--

CREATE TABLE `bookshop_discounts` (
  `id` int(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `discount` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_discounts`
--

INSERT INTO `bookshop_discounts` (`id`, `name`, `discount`) VALUES
(1, 'Без скидки', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_genres`
--

CREATE TABLE `bookshop_genres` (
  `id` int(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_genres`
--

INSERT INTO `bookshop_genres` (`id`, `name`, `slug`) VALUES
(1, 'Приключения', ''),
(2, 'Детская лит-ра', ''),
(3, 'Історична літ-ра', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_orders`
--

CREATE TABLE `bookshop_orders` (
  `id` int(25) NOT NULL,
  `date` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `payment_id` int(25) NOT NULL,
  `delivery_id` int(25) NOT NULL,
  `status_id` int(25) NOT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_order_statuses`
--

CREATE TABLE `bookshop_order_statuses` (
  `id` int(25) NOT NULL,
  `status_type` varchar(25) NOT NULL,
  `color` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_payments`
--

CREATE TABLE `bookshop_payments` (
  `id` int(25) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookshop_users`
--

CREATE TABLE `bookshop_users` (
  `id` int(25) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `token` varchar(60) NOT NULL,
  `role` varchar(10) NOT NULL,
  `banned` tinyint(1) NOT NULL,
  `discount_id` int(25) NOT NULL,
  `login` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bookshop_users`
--

INSERT INTO `bookshop_users` (`id`, `first_name`, `last_name`, `email`, `password_hash`, `token`, `role`, `banned`, `discount_id`, `login`) VALUES
(1, 'Одмен', 'Одменский', 'admin@webmaster.loc', '', '', 'admin', 0, 0, 'admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ashop_brands`
--
ALTER TABLE `ashop_brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ashop_cars`
--
ALTER TABLE `ashop_cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ashop_orders`
--
ALTER TABLE `ashop_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ashop_users`
--
ALTER TABLE `ashop_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_authors`
--
ALTER TABLE `bookshop_authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_books`
--
ALTER TABLE `bookshop_books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_carts`
--
ALTER TABLE `bookshop_carts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_cart_statuses`
--
ALTER TABLE `bookshop_cart_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_deliveries`
--
ALTER TABLE `bookshop_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_discounts`
--
ALTER TABLE `bookshop_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_genres`
--
ALTER TABLE `bookshop_genres`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_orders`
--
ALTER TABLE `bookshop_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_order_statuses`
--
ALTER TABLE `bookshop_order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_payments`
--
ALTER TABLE `bookshop_payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshop_users`
--
ALTER TABLE `bookshop_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ashop_brands`
--
ALTER TABLE `ashop_brands`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ashop_cars`
--
ALTER TABLE `ashop_cars`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ashop_orders`
--
ALTER TABLE `ashop_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ashop_users`
--
ALTER TABLE `ashop_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `bookshop_authors`
--
ALTER TABLE `bookshop_authors`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `bookshop_books`
--
ALTER TABLE `bookshop_books`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `bookshop_carts`
--
ALTER TABLE `bookshop_carts`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookshop_cart_statuses`
--
ALTER TABLE `bookshop_cart_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookshop_deliveries`
--
ALTER TABLE `bookshop_deliveries`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookshop_discounts`
--
ALTER TABLE `bookshop_discounts`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `bookshop_genres`
--
ALTER TABLE `bookshop_genres`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `bookshop_orders`
--
ALTER TABLE `bookshop_orders`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookshop_order_statuses`
--
ALTER TABLE `bookshop_order_statuses`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookshop_payments`
--
ALTER TABLE `bookshop_payments`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookshop_users`
--
ALTER TABLE `bookshop_users`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
