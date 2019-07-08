<?php
/**
 * Created by PhpStorm.
 * User: Алексей
 * Date: 06.07.2019
 * Time: 9:13
 */

namespace app\models;
use core\base\Model;

class Books extends Model
{
    protected $table = 'books';


    public function findAll($column = 'name', $orderBy = 'ASC')
    {
        $sql = "SELECT {$this->table}.id, {$this->table}.name, price, pubyear, isbn, description, pic, slug, lang, ".DB_PREFIX."discounts.discount FROM {$this->table}
                  INNER JOIN ".DB_PREFIX."discounts ON {$this->table}.discount_id = ".DB_PREFIX."discounts.id
                    ORDER BY {$column} {$orderBy}";
        return $this->pdo->query($sql);
    }

    public function findByAuthorGenreId($authorId, $genreId)
    {
        $sql = "SELECT books.id, books.name, books.slug, books.price, books.pubyear, books.lang, books.description FROM books 
                      LEFT JOIN book_author ON books.id=book_author.book_id 
                      LEFT JOIN book_genre ON books.id=book_genre.book_id 
                WHERE book_author.author_id = ? OR book_genre.genre_id = ? 
                GROUP BY books.id";
        return $this->pdo->query($sql, [$authorId, $genreId]);
    }

    public function create($name, $price, $pubYear, $isbn, $description, $pic, $lang, $authors, $genres)
    {
        $slug = translit($name);

        $sql = "INSERT INTO {$this->table} (name, slug, price, pubyear, isbn, lang, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $res = $this->pdo->execute($sql, [$name, $slug, $price, $pubYear, $isbn, $lang, $description]);

        $lastId = $this->pdo->lastInsertId();

        $sql = "INSERT INTO book_author (book_id, author_id) VALUES (?, ?)";
        foreach ($authors as $author){
            $res = $this->pdo->execute($sql, [$lastId, $author]);
        }

        $sql = "INSERT INTO book_genre (book_id, genre_id) VALUES (?, ?)";
        foreach ($genres as $genre) {
            $res =  $this->pdo->execute($sql, [$lastId, $genre]);
        }

        return $res;
    }

    public function update($bookId, $name, $price, $pubyear, $lang, $description, $authors, $genres)
    {
        $slug = translit($name);

        $sql = "DELETE FROM book_author WHERE book_id = ? ";
        $res = $this->pdo->execute($sql, [$bookId]);

        $sql = "DELETE FROM book_genre WHERE book_id = ? ";
        $res = $this->pdo->execute($sql, [$bookId]);

        $sql = "UPDATE {$this->table} SET name = ?, slug = ?, price = ?, pubyear = ?, lang = ?, description  = ? WHERE id = ? ";
        $res = $this->pdo->execute($sql, [$name, $slug, $price, $pubyear, $lang, $description, $bookId]);


        $sql = "INSERT INTO book_author (book_id, author_id) VALUES (?, ?)";
        foreach ($authors as $author){
            $res = $this->pdo->execute($sql, [$bookId, $author]);
        }

        $sql = "INSERT INTO book_genre (book_id, genre_id) VALUES (?, ?)";
        foreach ($genres as $genre) {
            $res =  $this->pdo->execute($sql, [$bookId, $genre]);
        }

        return $res;
    }

    public function delete($bookId)
    {
        $sql = "DELETE FROM {$this->table} WHERE id = ?";
        if($this->pdo->execute($sql, [$bookId])){
            $sql = "DELETE FROM book_author WHERE book_id = ?";
            if($this->pdo->execute($sql, [$bookId])){
                $sql = "DELETE FROM book_genre WHERE book_id = ?";
                return $this->pdo->execute($sql,[$bookId]);
            }else
                return false;
        }
        return false;
    }
}