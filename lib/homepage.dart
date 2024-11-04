import 'package:bitirmeprojesi/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(user: null,),
    );
  }
}

class HomePage extends StatefulWidget {
  final User? user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    ProfilePage(user: FirebaseAuth.instance.currentUser),
    const Bildirim(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff343131),
        title: const Text(
          "Dijital Şiddet",
          style: TextStyle(color: Color(0xffDBD3D3)),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Color(0xffDBD3D3),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bildirim()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(0xffDBD3D3),
        backgroundColor: const Color(0xff343131),
        height: 60,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home),
          Icon(Icons.person),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 400,
              height: 320,
              decoration: BoxDecoration(
                color: const Color(0xffDBD3D3),
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Dijital şiddet Nedir?\n\n"
                  "Dijital şiddet, dijital iletişim araçları aracılığıyla uygulanan psikolojik, "
                  "cinsel, ekonomik zarar vermeyi amaçlayan saldırılardır. Dijital şiddetin faili/failleri, "
                  "kişinin tanımadığı insanlar olabileceği gibi, tanıdığı insanlar da olabilir.\n\n"
                  "Dijital şiddet, dijital iletişim araçlarının bir kişiyi kontrol etmek, baskılamak, "
                  "korkutmak, yıldırmak, aşağılamak, tehdit etmek, hedef göstermek amaçlı kullanılmasıdır.",
                  style: TextStyle(
                      fontSize: 17.12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Aşağıdan bilgi almak istediğiniz dijital şiddet türünü seçiniz.",
            style: TextStyle(color: Color(0xffDBD3D3), fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 40),
                    foregroundColor: const Color(0xff091057),
                    backgroundColor: const Color(0xffDBD3D3),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Data1Page()));
                  },
                  child: const Text(
                    "Siber Zorbalık",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 40),
                    foregroundColor: const Color(0xff091057),
                    backgroundColor: const Color(0xffDBD3D3),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Data2Page()));
                  },
                  child: const Text(
                    "Gizlilik İhlali (Privacy Violation) ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 40),
                    foregroundColor: const Color(0xff091057),
                    backgroundColor: const Color(0xffDBD3D3),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Data3Page()));
                  },
                  child: const Text(
                    "Doxing",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 40),
                    foregroundColor: const Color(0xff091057),
                    backgroundColor: const Color(0xffDBD3D3),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Data4Page()));
                  },
                  child: const Text(
                    "Israrlı Takip (Stalking)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Data1Page extends StatelessWidget {
  const Data1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffDBD3D3)),
        backgroundColor: const Color(0xff343131),
        title: const Text(
          "Siber Zorbalık",
          style: TextStyle(
              color: Color(0xffDBD3D3),
              fontWeight: FontWeight.bold,
              fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity, // Yatayın hepsini kaplar
            decoration: BoxDecoration(
              color: const Color(0xffDBD3D3),
              border: Border.all(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Siber zorbalık, dijital ortamda bir kişiye veya gruba yönelik zarar verici, tehdit edici, alaycı veya düşmanca davranışlar sergileyen bir şiddet türüdür. Bu tür zorbalık, sosyal medya, e-posta, mesajlaşma uygulamaları ve çevrimiçi oyunlar gibi dijital platformlarda gerçekleşir. Siber zorbalık, kurbanın psikolojik sağlığını olumsuz etkileyebilir ve birçok durumda uzun vadeli travmalara yol açabilir.\n\n"
                "Siber Zorbalığın Şekilleri:\n"
                "- **Alay etme ve Hakaret:** Mağduru küçümseyen, aşağılayan veya cinsiyetçi, ırkçı ifadelerle rahatsız eden mesajlar göndermek. Bu, genellikle sosyal medya üzerinden gerçekleşir.\n\n"
                "- **Tehditler:**\n Mağdura zarar verme tehdidi içeren mesajlar. Bu tür tehditler, fiziksel şiddet veya ifşa korkusu şeklinde olabilir.\n\n"
                "- **Yalan ve İftira:**\n Mağdur hakkında yanlış bilgiler yayarak itibarını zedeleme. Bu tür eylemler, sosyal ilişkilerde ve iş yaşamında ciddi sorunlara yol açabilir.\n\n"
                "- **Dışlama:**\n Belirli bir gruptan veya sosyal çevreden bir kişiyi dışlayarak sosyal izolasyona neden olma. Bu, kurbanın yalnızlık hissi yaşamasına yol açabilir.\n\n"
                "Etkileri:\n"
                "Siber zorbalık mağdurlarında sık görülen etkiler arasında anksiyete, depresyon, düşük özsaygı ve sosyal fobi yer alır. Genç bireyler özellikle siber zorbalıktan etkilenme konusunda savunmasızdır. Araştırmalar, siber zorbalık mağduru olan gençlerin, intihar düşünceleriyle başa çıkma konusunda daha fazla zorlandığını göstermektedir.\n\n"
                "Mücadele Yöntemleri:\n"
                "Siber zorbalıkla mücadelede, aileler ve eğitimciler önemli bir rol oynamaktadır. Okullarda siber zorbalık hakkında farkındalık yaratmak, gençlere uygun davranışları öğretmek ve destek sistemleri oluşturmak bu sorunun azaltılmasına yardımcı olabilir. Ayrıca, kurbanların yaşadığı olayları belgelemeleri ve yetkililere başvurmaları önerilmektedir.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Data2Page extends StatelessWidget {
  const Data2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffDBD3D3)),
        backgroundColor: const Color(0xff343131),
        title: const Text(
          "Gizlilik İhlali (Privacy Violation) ",
          style: TextStyle(
              color: Color(0xffDBD3D3),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffDBD3D3),
              border: Border.all(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '''
Gizlilik ihlali, bir kişinin dijital ortamda özel bilgilerinin izinsiz bir şekilde ele geçirilmesi ve paylaşılmasıdır. Bu tür ihlaller, mağdurun kişisel e-postalarının, mesajlarının, fotoğraflarının veya videolarının rızası olmadan yayınlanması gibi durumları içerir. Dijital ortamlarda gizliliğin ihlali, mağdurun mahremiyetini zedeler ve genellikle psikolojik rahatsızlık ve güvensizlik hissine yol açar.

Bu ihlaller, genellikle sosyal medya platformlarında, e-posta hesaplarında ya da mesajlaşma uygulamalarında gerçekleştirilebilir. Örneğin, bir kişinin kişisel verilerinin, iş ya da sosyal çevresiyle ilgili bilgilerinin veya özel yazışmalarının paylaşılması, mağdura ciddi zarar verebilir. Bu tür gizlilik ihlalleri, çoğu zaman iş kaybına, sosyal itibar zedelenmesine ve ilişkilerin zarar görmesine yol açabilir.

Gizlilik ihlali karşısında mağdurların, izinsiz içeriklerin paylaşıldığı platforma bildirimde bulunmaları ve yasal haklarını korumak için suç duyurusunda bulunmaları mümkündür. Türk Ceza Kanunu’nda bu tür ihlaller; özel hayatın gizliliğini ihlal, kişisel verilerin izinsiz paylaşımı veya tehdit gibi suçlar kapsamında değerlendirilebilir.

Daha fazla bilgi ve koruyucu yöntemler için UNFPA Türkiye ve HERA Digital Health sitelerinde ilgili detaylar yer almaktadır.
''',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Data3Page extends StatelessWidget {
  const Data3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffDBD3D3)),
        backgroundColor: const Color(0xff343131),
        title: const Text(
          "Doxing",
          style: TextStyle(
              color: Color(0xffDBD3D3),
              fontWeight: FontWeight.bold,
              fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffDBD3D3),
                  border: Border.all(color: Colors.black, width: 5),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '''
Doxing, bir kişinin kişisel bilgilerinin (ad, adres, telefon numarası, e-posta gibi) izinsiz bir şekilde internette yayınlanmasıdır. Bu dijital şiddet türü, özellikle hedeflenen kişinin mahremiyetini ihlal ederek ona karşı fiziksel veya psikolojik tehdit oluşturmayı amaçlar. Doxing genellikle intikam alma, göz korkutma ya da kişiyi utandırma gibi amaçlarla yapılır. Bu bilgiler, sosyal medya profilleri, kamuya açık veri tabanları veya çeşitli web siteleri üzerinden toplanarak paylaşılır.

Doxing'in etkileri mağdur için çok ciddi olabilir. Örneğin, kişinin özel adresinin veya telefon numarasının internette paylaşılması, o kişinin fiziksel güvenliğini tehdit altına sokabilir. Ayrıca, kişinin sosyal itibarını zedeleyerek iş veya sosyal çevresiyle ilişkilerinin zarar görmesine neden olabilir. Özellikle kamuya mal olmuş kişiler veya aktivistler, siyasi veya ideolojik nedenlerle doxing saldırılarına daha fazla maruz kalmaktadır.

Doxing'e karşı hukuki mücadeleler de mevcuttur. Türk Ceza Kanunu, kişisel verilerin hukuka aykırı olarak ele geçirilmesi, paylaşılması veya yayılması gibi durumlara ilişkin yaptırımlar içermektedir. Bu tür bir durumla karşılaşan mağdurlar, paylaşılan bilgileri derhal belgeleyerek ilgili platformlara şikayette bulunabilir ve yasal yollardan haklarını arayabilirler.

Daha fazla bilgi almak için UNFPA Türkiye ve HERA Digital Health sitelerini inceleyebilirsiniz.
''',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // Additional content for Data1Page...
          ],
        ),
      ),
    );
  }
}

class Data4Page extends StatelessWidget {
  const Data4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffDBD3D3)),
        backgroundColor: const Color(0xff343131),
        title: const Text(
          "Israrlı Takip (Stalking)",
          style: TextStyle(
              color: Color(0xffDBD3D3),
              fontWeight: FontWeight.bold,
              fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffDBD3D3),
                  border: Border.all(color: Colors.black, width: 5),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '''Israrlı takip, dijital ortamda mağduru sürekli izleyerek rahatsız eden bir dijital şiddet türüdür. Bu tür, mağdurun dijital alanlarda takip edilmesini, ona yönelik ısrarlı mesajlar, yorumlar ya da rahatsız edici içerikler gönderilmesini içerir. Israrlı takip genellikle sosyal medya, e-posta veya mesajlaşma uygulamaları üzerinden yapılır ve mağdurun günlük yaşamını olumsuz etkileyebilir. Mağdurlar, takip edildiklerini bildiklerinde sürekli güvensizlik, kaygı ve stres yaşar; bu durum bazen onların dijital ortamdan uzaklaşmalarına veya sosyal izolasyon yaşamalarına neden olabilir.

Özellikle kadınlar, bu tür dijital tacize daha sık maruz kalmaktadır. Türkiye’de yapılan araştırmalarda, kadınların %30’a yakınının dijital ortamda ısrarlı takibe uğradığı belirtilmektedir. Mağdurlar genellikle güvensizlik hisseder, fiziksel güvenliklerinin de tehlikede olduğunu düşünürler. Bu durumun daha da ağırlaşması, mağdurun fiziksel mekân değiştirmesine veya sosyal çevresinden uzaklaşmasına yol açabilir.

Dijital ısrarlı takipte mağdurları korumak için, hukuki olarak bu tür tacizlerin suç sayılabileceği kanunlar bulunmaktadır. Türk Ceza Kanunu’nda, cinsel taciz, tehdit, hakaret gibi suçlardan dolayı hukuki yaptırımlar uygulanabilir. Bu konuda mağdurların, taciz durumlarında dijital platformlardaki delilleri saklayarak adli mercilere başvurması önerilmektedir.''',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // Additional content for Data1Page...
          ],
        ),
      ),
    );
  }
}

class Bildirim extends StatelessWidget {
  const Bildirim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        title: const Text(
          "Bildirimler",
          style: TextStyle(color: Color(0xffDBD3D3)),
        ),
        iconTheme: const IconThemeData(color: Color(0xffDBD3D3)),
        backgroundColor: const Color(0xff343131),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeContent())); // Geri gitme işlemi
          },
        ),
      ),
      body: Center(
        child: const Text(
          "Henüz bir bildirim yok",
          style: TextStyle(color: Color(0xffDBD3D3), fontSize: 20),
        ),
      ),
    );
  }
}
