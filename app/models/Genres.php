<?php
/**
 * Created by PhpStorm.
 * User: Алексей
 * Date: 06.07.2019
 * Time: 10:43
 */

namespace app\models;
use core\base\Model;
use core\CommonHelper;


class Genres extends Model
{

    protected $table = 'genres';

    public function findByBookId($id)
    {
        $sql = "SELECT * FROM ".DB_PREFIX."books_genres LEFT JOIN {$this->table} ON ".DB_PREFIX."books_genres.genre_id={$this->table}.id WHERE book_id = ?";
        return $this->pdo->query($sql, [$id]);
    }

    public function create($genre)
    {
        $slug = CommonHelper::translit($genre);
        $sql = "INSERT INTO {$this->table} (name, slug) VALUES (?, ?)";
        return $this->pdo->execute($sql,[$genre, $slug]);
    }

    public function update($genreId, $genre)
    {
        $slug = CommonHelper::translit($genre);

        $sql = "UPDATE {$this->table} SET name = ?, slug = ? WHERE id = ?";
        return $this->pdo->execute($sql, [$genre, $slug, $genreId]);
    }

    public function delete($genreId){
        $sql = "DELETE FROM {$this->table} WHERE id = ?";
        if($this->pdo->execute($sql, [$genreId])){
            $sql = "DELETE FROM book_genre WHERE genre_id = ?";
            return $this->pdo->execute($sql, [$genreId]);
        }
        return false;
    }
}