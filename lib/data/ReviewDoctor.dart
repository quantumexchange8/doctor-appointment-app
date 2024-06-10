class User{
  final String drName;
  final String picUrl;
  final String userName;
  final double rating;
  final String textReview;

  User({
    required this.drName,
    required this.picUrl,
    required this.userName,
    required this.rating,
    required this.textReview,
  });
}

List <User> UserReview = [
  User(
    drName: 'Dr. David Patel',
    picUrl: 'assets/image/user1.png', 
    userName: 'Emily Anderson', 
    rating: 5.0, 
    textReview: 'Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel.',
  ),

  User(
    drName: 'Dr. David Patel',
    picUrl: 'assets/icon/profile.png', 
    userName: 'John Smith', 
    rating: 4.8, 
    textReview: 'Dr. Patel is extremely knowledgeable and approachable. He explained my condition and treatment options clearly.',
  ),

  User(
    drName: 'Dr. David Patel',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Sophia Johnson', 
    rating: 5.0, 
    textReview: 'I had a great experience with Dr. Patel. His expertise and patient care are outstanding.',
  ),

  User(
    drName: 'Dr. Jessica Turner',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Linda Evans', 
    rating: 4.9, 
    textReview: 'Dr. Turner is incredibly knowledgeable and compassionate. She made my pregnancy experience much less stressful.',
  ),

  User(
    drName: 'Dr. Jessica Turner',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Patricia Kelly', 
    rating: 5.0, 
    textReview: 'Dr. Turner is an outstanding gynecologist. She is attentive and takes the time to answer all my questions.',
  ),

  User(
    drName: 'Dr. Michael Johnson',
    picUrl: 'assets/icon/profile.png',
    userName: 'George Allen',
    rating: 4.8,
    textReview: 'Dr. Johnson performed my knee surgery, and the results were excellent. His expertise is unmatched.',
  ),

  User(
    drName: 'Dr. Michael Johnson',
    picUrl: 'assets/icon/profile.png',
    userName: 'Megan Harris',
    rating: 5.0,
    textReview: 'Dr. Johnson is the best orthopedic surgeon. He helped me recover quickly from my sports injury.',
  ),

  User(
    drName: 'Dr. Emily Walker',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Heather Moore', 
    rating: 5.0, 
    textReview: 'Dr. Walker is amazing with kids. My children love her and always feel comfortable during visits.',
  ),

  User(
    drName: 'Dr. Emily Walker',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Chris Thompson', 
    rating: 4.9, 
    textReview: 'Dr. Walker is very caring and thorough. She provides excellent care for my children.',
  ),

  User(
    drName: 'Dr. Peter Parker',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Sharon Green', 
    rating: 4.7, 
    textReview: 'Dr. Parker is a great dentist. He made my dental procedures comfortable and painless.',
  ),

  User(
    drName: 'Dr. Peter Parker',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Tom Brown', 
    rating: 4.7, 
    textReview: 'Dr. Parker is very skilled and friendly. I am very happy with my new smile!',
  ),

  User(
    drName: 'Dr. Catherine Bender',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Barbara Clark', 
    rating: 5.0, 
    textReview: 'Dr. Bender is wonderful with kids. She provides excellent care and always takes time to listen to our concerns.',
  ),

  User(
    drName: 'Dr. Catherine Bender',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Kevin Martinez', 
    rating: 4.8, 
    textReview: 'Dr. Bender is a fantastic pediatrician. She has been taking care of my kids for years.',
  ),

  User(
    drName: 'Dr. Emma Blent',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Nancy Lewis', 
    rating: 4.9, 
    textReview: 'Dr. Blent is very thorough and caring. She provides comprehensive care and addresses all my concerns.',
  ),

  User(
    drName: 'Dr. Emma Blent',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Edward King', 
    rating: 5.0, 
    textReview: 'Dr. Blent is a great general practitioner. She is very knowledgeable and always puts her patients first.',
  ),

  User(
    drName: 'Dr. Sarah Johnson',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Carol Hall', 
    rating: 4.8, 
    textReview: 'Dr. Johnson is an exceptional gynecologist. She provided excellent care during my pregnancy.',
  ),

  User(
    drName: 'Dr. Sarah Johnson',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Larry Hill', 
    rating: 5.0, 
    textReview: 'Dr. Johnson is very professional and caring. I highly recommend her for any women\'s health issues.',
  ),

  User(
    drName: 'Dr. Rachel Adams',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Karen Scott', 
    rating: 4.9, 
    textReview: 'Dr. Adams is very thorough and compassionate. She made me feel comfortable during my visits.',
  ),

  User(
    drName: 'Dr. Rachel Adams',
    picUrl: 'assets/image/user2.png', 
    userName: 'Jason Young', 
    rating: 4.9, 
    textReview: 'Dr. Adams is an excellent gynecologist. She is very knowledgeable and attentive to her patients.',
  ),

  User(
    drName: 'Dr. James Anderson',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Steven Adams', 
    rating: 4.8, 
    textReview: 'Dr. Anderson is an outstanding orthopedic surgeon. His experience and skills are unmatched.',
  ),

  User(
    drName: 'Dr. James Anderson',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Sarah Brown', 
    rating: 5.0, 
    textReview: 'Dr. Anderson performed my hip replacement surgery, and I am very pleased with the results.',
  ),

  User(
    drName: 'Dr. Michael Chang',
    picUrl: 'assets/icon/profile.png', 
    userName: 'David Wilson', 
    rating: 4.9, 
    textReview: 'Dr. Chang is an exceptional cardiologist. His expertise and patient care are top-notch.',
  ),

  User(
    drName: 'Dr. Michael Chang',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Jessica White', 
    rating: 4.9, 
    textReview: 'Dr. Chang is very professional and caring. He took excellent care of my heart condition.',
  ),

  User(
    drName: 'Dr. Daniel Lee',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Jeffrey Robinson', 
    rating: 4.8, 
    textReview: 'Dr. Lee is very knowledgeable and thorough. He provided excellent care for my digestive issues.',
  ),

  User(
    drName: 'Dr. Daniel Lee',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Sandra Perez', 
    rating: 4.8, 
    textReview: 'Dr. Lee is an outstanding gastroenterologist. He took the time to explain my condition and treatment options clearly.',
  ),

  User(
    drName: 'Dr. Laura White',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Kenneth Roberts', 
    rating: 4.7, 
    textReview: 'Dr. White is very caring and knowledgeable. She provides excellent care for my children.',
  ),

  User(
    drName: 'Dr. Laura White',
    picUrl: 'assets/icon/profile.png', 
    userName: 'Dorothy Thompson', 
    rating: 5.0, 
    textReview: 'Dr. White is an amazing pediatrician. She always takes the time to listen to our concerns and provide the best care possible.',
  ),

];

