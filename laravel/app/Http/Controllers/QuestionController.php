<?php

namespace App\Http\Controllers;

use App\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function getQuestion(Request $req)
    {
        $quizId = $req->quizId;

        if(!$quizId){
            return response()->json(['msg' => 'Quiz tidak ditemukan']);
        }
        
        $quizData = [];

        $quizzes = Question::where('bagian', $quizId)->get();

        if($quizzes){
            foreach($quizzes as $quiz) {
                $quizData[] = [
                    'picture' => $quiz->picture ? $quiz->picture : '',
                    'question' => $quiz->question,
                    'a' => $quiz->a,
                    'b' => $quiz->b,
                    'c' => $quiz->c,
                    'd' => $quiz->d,
                ];
            }
            
            return response()->json($quizData);
        }else{
            return response()->json(['msg' => 'Gagal memuat data!']);
        }
    }
}
