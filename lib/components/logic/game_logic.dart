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
      "desc": ["", ""]
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
      "desc": [
        "Kamu lebih memilih untuk meredam emosi kamu sendiri Ketika marah tanpa melampiaskannya pada orang ybs.",
        "Ketika marah dengan seseorang kamu lebih memilih untuk tidak memendamnya."
      ]
    },
    {
      "question": "Apakah kamu mengekspresikan apa yang kamu rasakan?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu untuk mengekspresikan apa yang sedang kamu rasakan.",
        "Kamu masih belum mampu untuk mengekspresikan perasaan yang sedang kamu rasakan."
      ]
    },
    {
      "question": "Apakah kamu selalu mengetahui penyebab kamu merasa marah?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu untuk mengidentifikasi penyebab kamu merasa marah dan kesal.",
        "Kamu belum mampu mengidentifikasi penyebab kamu merasa marah dan kesal."
      ]
    },
    {
      "question":
          "Apakah kamu lebih suka berada di keramaian daripada sendiri?",
      "userAnswer": null,
      "answer": null,
      "desc": [
        "Kamu lebih menyukai keramaian.",
        "Kamu lebih suka sendiri daripada berada ditengah keramaian."
      ]
    },
    {
      "question": "Apakah kamu sering mengobrol dengan teman-temanmu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu sering berkomunikasi dengan teman-temanmu untuk sekedar bertukar cerita atau menanyakan kabar.",
        "Kamu tidak sering mengobrol dengan teman-temannu."
      ]
    },
    {
      "question":
          "Apakah kamu dapat menerima hal buruk yang terjadi pada hidupmu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu menerima setiap hal baik atau buruk yang terjadi dalam hidupmu.",
        "Kamu masih belum mampu untuk menerima setiap kejadian buruk dalam hidupmu."
      ]
    },
    {
      "question": "Apakah kamu orang yang pendiam?",
      "userAnswer": null,
      "answer": null,
      "desc": ["", ""]
    },
    {
      "question": "Apakah kamu orang yang ceria?",
      "userAnswer": null,
      "answer": null,
      "desc": ["", ""]
    },
    {
      "question":
          "Apakah kamu dapat menerima kritikan orang lain tentang dirimu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu adalah orang terbuka dan mampu untuk menerima kritikan atau pendapat orang lain tanpa merasa tersinggung.",
        "Kamu merasa tidak mudah menerima pendapat orang lain tentang dirimu sendiri, sehingga kamu perlu melakukan introspeksi diri agar kamu lebih mengenal diri kamu."
      ]
    },
    {
      "question": "Apakah kamu menyukai tantangan?",
      "userAnswer": null,
      "answer": null,
      "desc": [
        "Kamu adalah orang yang menyukai sesuatu yang menantang dan menguji adrenalin.",
        ""
      ]
    },
    {
      "question": "Apakah kamu menyukai kegiatan yang teratur dan terencana?",
      "userAnswer": null,
      "answer": null,
      "desc": [
        "Kamu adalah orang yang selalu membuat perencanaan sebelum melakukan sesuatu, kamu juga menyukai keteraturan.",
        "Kamu adalah orang yang fleksibel, tidak terlalu memikirkan perencanaan dan keteraturan, kamu melakukan sesuatu dengan fleksibel."
      ]
    },
    {
      "question":
          "Apakah pandangan orang lain terhadap kamu sudah sesuai dengan diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu menyetujui pandangan orang lain terhadap kamu sudah sesuai dengan diri kamu.",
        "Kamu merasa pandangan orang lain tentang kamu tidak sesuai, sehingga kamu perlu melakukan introspeksi diri agar kamu lebih mengenal diri kamu."
      ]
    },
    {
      "question":
          "Apakah kamu merasa percaya diri untuk tampil berbeda dari orang lain?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu tidak peduli dengan pandangan orang lain terhadap penampilan kamu, sehingga kamu merasa percaya diri untuk tampil berbeda.",
        "Kamu masih merasa takut untuk terlihat berbeda dengan orang lain."
      ]
    },
    {
      "question":
          "Apakah kamu membuat keputusan dengan pertimbangan yang lama?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu adalah orang yang mempertimbangkan segala sesuatu dengan sangat matang, sehingga dalam pengambilan keputusan kamu membutuhkan waktu yang lama.",
        "Kamu mampu membuat keputusan dengan waktu yang relative cepat."
      ]
    },
    {
      "question": "Apakah kamu sudah mengetahui kelebihan diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": ["Kamu mampu mengetahui kelebihan pada diri kamu.", ""]
    },
    {
      "question": "Apakah kamu sudah mengetahui kekurangan diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": ["Kamu mampu mengetahui kekurangan pada diri kamu.", ""]
    },
    {
      "question":
          "Apakah kamu dapat menerima kekurangan yang ada pada diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu menerima kekurangan yang ada pada diri kamu.",
        "Kamu belum mampu menerima kekurangan yang ada pada diri kamu."
      ]
    },
    {
      "question": "Apakah kamu dapat mengetahui potensi yang kamu miliki?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu mengidentifikasi dan mengetahui potensi yang kamu miliki.",
        "Kamu belum dapat mengetahi potensi yang kamu miliki."
      ]
    },
    {
      "question": "Apakah kamu mengetahui peluang diri kamu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu dapat mengetahui dan menganalisa peluang yang kamu miliki.",
        "Kamu belum dapat mengetahui dan menganalisa peluang yang kamu miliki."
      ]
    },
    {
      "question": "Apakah kamu memiliki satu hobi yang paling kamu tekuni?",
      "userAnswer": null,
      "answer": true,
      "desc": ["", ""]
    },
    {
      "question": "Apakah kamu sudah memiliki rencana untuk 5 tahun kedepan?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu dapat mengetahui apa yang kamu inginkan dan rencana untuk 5 tahun kedepan.",
        "Kamu belum dapat mengetahui apa yang kamu inginkan dan rencana untuk 5 tahun kedepan."
      ]
    },
    {
      "question":
          "Apakah kamu sering menyalahkan orang lain ketika mendapatkan masalah?",
      "userAnswer": null,
      "answer": false,
      "desc": [
        "Ketika kamu mendapatkan masalah, kamu lebih nyaman dan merasa aman untuk menyalahkan orang lain daripada mengintrospeksi diri dan menerima masalah tersebut.",
        "Kamu mampu menerima masalah yang terjadi, berusaha memperbaikinya dan tidak menyalahkan orang lain atas masalah tersebut."
      ]
    },
    {
      "question": "Apakah kamu sudah mencintai dirimu sendiri?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu sudah mampu mencintai diri kamu sendiri.",
        "Kamu belum mampu mencintai diri kamu sendiri."
      ]
    },
    {
      "question": "Saya memiliki cita-cita yang akan saya wujudkan.",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu memiliki cita-cita dan tekad untuk mewujudkan cita-cita tersebut dengan segenap usaha yang kamu miliki.",
        ""
      ]
    },
    {
      "question": "Saya sering membedakan diri saya dengan orang lain.",
      "userAnswer": null,
      "answer": false,
      "desc": [
        "Kamu sering merasa rendah diri dan memandingkan diri kamu dengan orang lain.",
        "Kamu mampu untuk menerima diri kamu dan tidak membandingkan diri kamu dengan orang lain."
      ]
    },
    {
      "question": "Saya gampang menyerah ketika ada masalah.",
      "userAnswer": null,
      "answer": false,
      "desc": [
        "Kamu mudah menyerah ketika dihadapkan pada masalah.",
        "Kamu tidak mudah menyerah walaupun dihadapkan dengan berbagai masalah."
      ]
    },
    {
      "question": "Saya kurang mampu untuk bersyukur.",
      "userAnswer": null,
      "answer": false,
      "desc": ["", ""]
    },
    {
      "question": "Apakah kamu mengetahui apa yang membuat diri kamu Bahagia?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu menyadari alasan kamu merasa bahagia.",
        "Kamu belum mampu menyadari alasan kamu merasa bahagia."
      ]
    },
    {
      "question": "Saya tidak yakin dengan kemampuan yang saya miliki.",
      "userAnswer": null,
      "answer": false,
      "desc": ["", ""]
    },
    {
      "question": "Saya bangga kepada diri sendiri",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu dapat mencintai diri kamu sendiri dan merasa bangga dengan diri kamu sendiri apapun yang terjadi.",
        "Kamu belum dapat merasa bangga dengan diri kamu sendiri."
      ]
    },
    {
      "question": "Saya memiliki hobby yang saya senangi",
      "userAnswer": null,
      "answer": true,
      "desc": ["", ""]
    },
    {
      "question": "Saya adalah orang yang bertanggung jawab",
      "userAnswer": null,
      "answer": true,
      "desc": ["", ""]
    },
    {
      "question":
          "Saya mengetahui apa yang saya sukai dan yang tidak saya sukai",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu menyadari dan mengetahui tentang hal-hal yang kamu sukai dan tidak kamu sukai.",
        "Kamu belum mampu menyadari dan mengetahui tentang hal-hal yang kamu sukai dan tidak kamu sukai."
      ]
    },
    {
      "question": "Apakah kamu takut pada hal tertentu?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu memiliki ketakutan terhadap hal-hal tertentu, dan itu normal.",
        "Kamu memiliki keberanian yang hebat, kamu tidak memiliki ketakutan terhadap hal-hal tertentu."
      ]
    },
    {
      "question": "Apakah kamu memiliki tujuan hidup?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu mengetahui tujuan hidup kamu.",
        "Kamu belum mampu mengetahui tujuan hidup kamu."
      ]
    },
    {
      "question": "Saya memiliki motivasi ketika merasa gagal.",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu untuk memotivasi diri kamu untuk bangkit ketika kamu gagal.",
        ""
      ]
    },
    {
      "question": "Apakah kamu sudah memaafkan dirimu sendiri?",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Setiap orang memiliki kesalahan dan kamu hebat sudah mampu memaafkan diri kamu sendiri.",
        "Kamu belum mampu memaafkan diri kamu sendiri, tidak apa-apa pelan-pelan yaa kamu akan mampu untuk memaafkan diri kamu sendiri."
      ]
    },
    {
      "question": "Ketika merasa sedih saya akan menangis.",
      "userAnswer": null,
      "answer": true,
      "desc": [
        "Kamu mampu megekspresikan kesedihan kamu dengan cara menangis.",
        ""
      ]
    },
    {
      "question": "Apakah kamu merasa sudah mengenal dirimu sendiri?",
      "userAnswer": null,
      "answer": true,
      "desc": ["", ""]
    }
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
