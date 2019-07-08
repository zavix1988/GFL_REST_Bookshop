<?php
/**
 * Created by PhpStorm.
 * User: Алексей
 * Date: 06.07.2019
 * Time: 10:43
 */

namespace app\models;
use core\base\Model;


class Authors extends Model
{

    protected $table = 'authors';

    public function findByBookId($id)
    {
        $sql = "SELECT * FROM ".DB_PREFIX."books_authors LEFT JOIN {$this->table} ON ".DB_PREFIX."books_authors.author_id={$this->table}.id WHERE book_id = ?";
        return $this->pdo->query($sql,[$id]);
    }

    public function create($first_name, $last_name, $biography)
    {
        $slug = CommonHelper::translit($first_name)." ".CommonHelper::translit($last_name);

        $sql = "INSERT INTO {$this->table} (first_name, last_name, biography, slug) VALUES (?, ?, ?, ?)";
        return $this->pdo->execute($sql,[$first_name, $last_name, $biography, $slug]);
    }

    public function update($authorId, $first_name, $last_name, $biography)
    {
        $slug = CommonHelper::translit($first_name)." ".CommonHelper::translit($last_name);

        $sql = "UPDATE {$this->table} SET first_name = ?, last_name = ?, biography = ? slug = ?  WHERE id = ?";
        return $this->pdo->execute($sql, [$first_name, $last_name, $biography, $slug, $authorId]);
    }

    public function delete($authorId){
        $sql = "DELETE FROM {$this->table} WHERE id = ?";
        if($this->pdo->execute($sql, [$authorId])){
            $sql = "DELETE FROM book_author WHERE author_id = ?";
            return $this->pdo->execute($sql, [$authorId]);
        }
        return false;
    }
}