import 'dart:math';

class GameLogic {
  List<Map<String, dynamic>> questionList = [
    {
      "question": "Apakah kamu sudah menerima diri kamu sepenuhnya?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "kamu sudah mampu menerima dirimu dengan baik.",
        "kamu masih belum mampu menerima dirimu sepenuhnya."
      ]
    },
    {
      "question": "Apakah kamu suka insecure?",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Apakah kamu sering merasa insecure dengan bentuk fisikmu?",
      "userAnswer": null,
      "answer": false,
      "desc": [
        "Kamu merasa rendah diri dengan bentuk fisikmu dan terkadang membandingkan dirimu dengan orang lain.",
        "Kamu sudah mampu menerima bentuk fisikmu, kamu merasa percaya diri dengan fisikmu."
      ]
    },
    {
      "question": "Ketika ada masalah saya memilih untuk di pendam saja",
      "userAnswer": null,
      "answer": false,
      "desc": [
        "Ketika ada masalah kamu lebih memilih untuk memendamnya sendiri tanpa berbagi cerita dengan orang lain.",
        "Kamu orang yang cukup terbuka, ketika ada masalah kamu berani untuk menceritaknnya daripada memendamnya sendiri."
      ]
    },
    {
      "question":
          "Ketika kamu merasa marah pada seseorang kamu memilih untuk diam saja",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Apakah kamu mengekspresikan apa yang kamu rasakan?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu selalu mengetahui penyebab kamu merasa marah?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Apakah kamu lebih suka berada di keramaian daripada sendiri?",
      "userAnswer": null,
      "answer": null,
      "desc": []
    },
    {
      "question": "Apakah kamu sering mengobrol dengan teman-temanmu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Apakah kamu dapat menerima hal buruk yang terjadi pada hidupmu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu orang yang pendiam?",
      "userAnswer": null,
      "answer": null,
      "desc": []
    },
    {
      "question": "Apakah kamu orang yang ceria?",
      "userAnswer": null,
      "answer": null,
      "desc": []
    },
    {
      "question":
          "Apakah kamu dapat menerima kritikan orang lain tentang dirimu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu menyukai tantangan?",
      "userAnswer": null,
      "answer": null,
      "desc": []
    },
    {
      "question": "Apakah kamu menyukai kegiatan yang teratur dan terencana?",
      "userAnswer": null,
      "answer": null,
      "desc": []
    },
    {
      "question":
          "Apakah pandangan orang lain terhadap kamu sudah sesuai dengan diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Apakah kamu merasa percaya diri untuk tampil berbeda dari orang lain?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Apakah kamu membuat keputusan dengan pertimbangan yang lama?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu sudah mengetahui kelebihan diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu sudah mengetahui kekurangan diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Apakah kamu dapat menerima kekurangan yang ada pada diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu dapat mengetahui potensi yang kamu miliki?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu mengetahui peluang diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu memiliki satu hobi yang paling kamu tekuni?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu sudah memiliki rencana untuk 5 tahun kedepan?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Apakah kamu sering menyalahkan orang lain Ketika mendapatkan masalah?",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Apakah kamu sudah mencintai dirimu sendiri?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Saya memiliki cita-cita yang akan saya wujudkan.",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Saya sering membedakan diri saya dengan orang lain.",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Saya gampang menyerah ketika ada masalah.",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Saya kurang mampu untuk bersyukur.",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Apakah kamu mengetahui apa yang membuat diri kamu Bahagia?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Saya tidak yakin dengan kemampuan yang saya miliki.",
      "userAnswer": null,
      "answer": false,
      "desc": []
    },
    {
      "question": "Saya bangga kepada diri sendiri",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Saya adalah orang yang bertanggung jawab",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question":
          "Saya mengetahui apa yang saya sukai dan yang tidak saya sukai",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu takut pada hal tertentu?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu memiliki tujuan hidup?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Saya memiliki motivasi ketika merasa gagal.",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu sudah memaafkan dirimu sendiri?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Ketika merasa sedih saya akan menangis.",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
    {
      "question": "Apakah kamu merasa sudah mengenal dirimu sendiri?",
      "userAnswer": null,
      "answer": true,
      "desc": []
    },
  ];
  GameLogic();

  List<Map<String, dynamic>> getQuestionList() {
    qustionListShuffle();
    List<Map<String, dynamic>> subList = List.empty();
    subList = questionList.sublist(0, 20);
    return subList;
  }

  void qustionListShuffle() {
    questionList.shuffle(Random(DateTime.now().millisecondsSinceEpoch));
  }
}
