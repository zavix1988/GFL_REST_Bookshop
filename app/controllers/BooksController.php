<?php
/**
 * Created by PhpStorm.
 * User: zavix
 * Date: 05.07.19
 * Time: 20:13
 */

namespace app\controllers;
use core\base\Controller;
use app\models\Books;
use app\models\Authors;
use app\models\Genres;
use app\models\Discounts;

class BooksController extends Controller
{
    private $books;
    private $authors;
    private $genres;
    private $discounts;

    public function __construct($route)
    {
        parent::__construct($route);
        $this->books = new Books();
        $this->authors = new Authors();
        $this->genres = new Genres();
        $this->discounts = new Discounts();
    }

    public function getAllBooks()
    {
        $books = $this->books->findAll();
        $genres = $this->genres->findAll('id');
        $authors = $this->authors->findAll('id');
        if(count($books)>0){
            for ($i = 0; $i<count($books); $i++){
                $books[$i]['authors'] = $this->authors->findByBookId($books[$i]['id']);
                $books[$i]['genres'] = $this->genres->findByBookId($books[$i]['id']);
            }
        }
        $this->setData(compact('books', 'genres', 'authors'));
    }

    public function getBook($params)
    {
        $book = $this->books->findOne($params[0], 'slug');
        $book = $book[0];
        $book['genres'] = $this->genres->findByBookId($book['id']);
        $book['authors'] = $this->authors->findByBookId($book['id']);
        $this->setData(compact('book', 'bookAuthors', 'bookGenres'));
    }

    public function getFilter()
    {
        $genres = $this->genres->findAll();
        $authors = $this->authors->findAll();
        $formAuthor = (int)$_GET['author']*1;
        $formGenre = (int)$_GET['genre']*1;
        if (!($formAuthor <= 0 && $formGenre <= 0)){
            $books = $this->books->findByAuthorGenreId($formAuthor, $formGenre);
            if(count($books)>0){
                for ($i = 0; $i<count($books); $i++){
                    $books[$i]['authors'] = $this->authors->findByBookId($books[$i]['id']);
                    $books[$i]['genres'] = $this->genres->findByBookId($books[$i]['id']);
                }
            }
            $this->setData(compact('newBooks', 'genres', 'authors'));
        }
    }
}

