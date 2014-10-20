<?php
// header('Content-Type: application/json; charset=UTF-8');
error_reporting(E_ALL);
  $action = $_POST['action'];
  switch ($action) {
    case 'loadQuestions':
      echo loadQuestions();
      break;
    case 'submitAnswer':
      if ( isset($_POST['q_id']) && isset($_POST['a_id']) && isset($_POST['extra']) )
      {
        print_r($_POST);
        submit(intval($_POST['q_id']), intval($_POST['a_id']), $_POST['extra']);
      }
      break;
  }
  // echo json_encode(getQuestions());

  // submitAnswer(2,1);
  // submitAnswer(2,3,'Lorem indalksd adhjke qwebnm n,avscnxc  ;l;0oqwemnnv pp');

function loadQuestions()
{
  require_once '_conn.php';
  return json_encode(getQuestions());
}

function submit($q_id, $a_id, $additional)
{
  require_once '_conn.php';
  sleep(1);
  submitAnswer($q_id, $a_id, $additional);
}