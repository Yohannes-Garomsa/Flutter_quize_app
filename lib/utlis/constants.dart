import '../models/question.dart';

List<Question> dummyQuestions = [
  Question(
    questionText: "What is the capital of France?",
    options: ["London", "Berlin", "Paris", "Madrid"],
    correctAnswer: "Paris",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Paris_vue_d%27ensemble_tour_Eiffel.jpg/2560px-Paris_vue_d%27ensemble_tour_Eiffel.jpg",
  ),
  Question(
    questionText: "What is the capital of Ethiopia?",
    options: ["Addis Ababa", "Dire Dawa", "Bahir Dar", "Mekelle"],
    correctAnswer: "Addis Ababa",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Addis_Ababa_Collage.png/2560px-Addis_Ababa_Collage.png",
  ),
  Question(
    questionText: "Which is the largest continent?",
    options: ["Africa", "Asia", "Europe", "Australia"],
    correctAnswer: "Asia",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Asia_satellite_orthographic.jpg/2560px-Asia_satellite_orthographic.jpg",
  ),
  Question(
    questionText: "Flutter is developed by?",
    options: ["Apple", "Google", "Microsoft", "Facebook"],
    correctAnswer: "Google",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/2560px-Google_2015_logo.svg.png",
  ),
];
