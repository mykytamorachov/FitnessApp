<?php
  function getConn()
  {
    return new PDO('mysql:host=localhost;dbname=fitness_inquirer;charset=UTF8', 'root', 'root');
  }

  function getQuestions()
  {
    $db = getConn();
    $res = array();
    $q_statement = $db->prepare('SELECT q_id, q_text
        FROM questions');
    // $sth->bindParam(':calories', $calories, PDO::PARAM_INT);
    // $sth->bindParam(':colour', $colour, PDO::PARAM_STR, 12);
    $q_statement->execute();
    while ( $q_row = $q_statement->fetch() )
    {
      $a_statement = $db->prepare('SELECT a_id, a_text FROM answers WHERE q_id=:q_id');
      $a_statement->bindParam(':q_id', $q_row['q_id'], PDO::PARAM_INT);
      $a_statement->execute();
      $ans = array();
      while ( $a_row = $a_statement->fetch() )
      {
        $ans[] = array('a_id' => $a_row['a_id'], 'a_text' => $a_row['a_text']);
      }
      $res[] = array('q_id' => $q_row['q_id'],'q_text' => $q_row['q_text'], 'answers' => $ans);
    }
    $q_statement = null;
    $a_statement = null;
    $db = null;
    
    return $res;

  }

  function submitAnswer( $q_id = null, $a_id = null, $additional = '' )
  {
    if (!$q_id || !$a_id) {
      return false;
    } else {
      $db = getConn();
      $q = $db->prepare('INSERT INTO results(q_id,a_id,additional) VALUES(:q_id,:a_id,:additional)');
      $q->bindParam(':q_id',$q_id,PDO::PARAM_INT);
      $q->bindParam(':a_id',$a_id,PDO::PARAM_INT);
      $q->bindParam(':additional',$additional,PDO::PARAM_STR);
      $q->execute();

      $q = null;
      $db = null;
    }
  }