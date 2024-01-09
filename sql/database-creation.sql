-- Create the database
CREATE DATABASE healthcare;

-- Connect to the database
.open healthcare.db;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(80) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    hashed_password VARCHAR(120) NOT NULL
);

CREATE INDEX idx_users_username ON users (username);
CREATE INDEX idx_users_email ON users (email);

CREATE TABLE sqlite_sequence(name,seq);

CREATE TABLE workouts (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE INDEX idx_workouts_category ON workouts (category);

CREATE TABLE articles (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
	image_path VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_articles_category ON articles (category);

CREATE TABLE activities (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    age INTEGER NOT NULL,
    gender VARCHAR(10) NOT NULL,
    weight FLOAT NOT NULL,
    height FLOAT NOT NULL,
    activity_type VARCHAR(50) NOT NULL,
    duration INTEGER NOT NULL,
    intensity VARCHAR(10) NOT NULL,
    resting_heart_rate INTEGER NOT NULL,
    exercise_heart_rate INTEGER NOT NULL,
    body_fat_percentage FLOAT NOT NULL,
    muscle_mass FLOAT NOT NULL,
    water_intake FLOAT NOT NULL,
    registered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE INDEX idx_user_id ON activities (user_id);

CREATE TABLE contacts (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO workouts (name, description, image_path, category) VALUES
('Upper Body - Gym', 'Exercises to work the upper body', 'images/workouts/upper-body.jpg', 'upper body'),
('Lower Body - Gym', 'Exercises to work the lower body', 'images/workouts/lower-body.jpg', 'lower body'),
('Stretching at Home', 'Exercises to stretch your body at home (no equipment)', 'images/workouts/stretch.jpg', 'stretch'),
('Yoga at Home', 'Yoga class to do at home (no equipment)', 'images/workouts/yoga.jpg', 'yoga'),
('Cycling', 'Cycling class to do at the gym or at home', 'images/workouts/cycling.jpg', 'cycling'),
('Running - Gym', 'Get tips to practice running in the gym', 'images/workouts/running-gym.jpg', 'running'),
('Lower Body - Home', 'Exercises to work the lower body at home (no equipment)', 'images/workouts/lower_body_home.jpg', 'lower body'),
('Yoga - Gym', 'Yoga class to do at the gym', 'images/workouts/yoga_gym.jpg', 'yoga');

INSERT INTO articles (title, content, category, image_path, created_at) VALUES 
('Healthy diet linked to better cardiovascular fitness','A heart-healthy diet that focuses on plant-based foods is closely tied to improved physical fitness, a new study finds.|The study included 2,380 middle-aged people in the Framingham Heart Study, a long-term, multigenerational study that seeks to uncover the underlying causes of cardiovascular disease. All participants underwent a cardiopulmonary exercise test, the gold standard for assessing fitness. They also completed questionnaires to assess the quality of their diets, noting how often they consumed 126 foods and drinks during the previous year. Higher-quality diets emphasized vegetables, fruits, whole grains, nuts, legumes, fish, and healthy fats, and limited red meat and alcohol.|Researchers adjusted for possible confounding factors that might affect the diet-fitness relationship, including how many calories the participants consumed, their body mass index, and their routine physical activity levels. They found that healthy dietary habits were strongly and positively linked with fitness. The improvement in fitness seen among those with the healthiest diets was similar to the effect of an additional 4,000 steps each day, say the authors. Their study was published May 15, 2023, in the European Journal of Preventive Cardiology.', 'heart health', 'images/articles/healthy_diet_better_cardiovascular_fitness.jpg', '2023-07-01 17:24:12'),
('Diet and prostate cancer','A plant-based diet can help people lower their risk for heart disease and diabetes. But what about prostate cancer? Can this medically touted eating pattern protect you from the most common cancer among men?|"Unfortunately, there is no miracle prostate cancer diet," says Dr. Bradley McGregor, an oncologist with Harvard-affiliated Dana-Farber Cancer Institute. "But as we learn more about the role diet plays in disease prevention, there is growing evidence that plant-based diets may lower your risk of prostate cancer and even help slow its spread."', 'men health', 'images/articles/diet_and_prostate_cancer.jpg', '2023-07-01 17:24:12'),
('A combination of healthy diets linked with longer life','Healthier eating leads to better health. But does it matter what kind of healthy eating plan you follow? Researchers looked at the effect of four healthy eating patterns on more than 120,000 people. The four patterns, all recommended by the Dietary Guidelines for Americans, were the Healthy Eating Index 2015, Alternate Mediterranean Diet, Healthful Plant-based Diet, and Alternate Healthy Eating Index. While they differ somewhat, all four encourage high consumption of plant-based foods like grains, fruits, vegetables, nuts, and legumes.|The participants filled out dietary questionnaires every four years for over three decades. The data showed that those who closely followed one or more of the four healthy eating patterns were less likely to die from cardiovascular disease, cancer, or respiratory disease during this period compared with those who did not follow any of the four patterns or did so less often. The results suggest that the ideal healthy eating pattern need not always be one particular diet but could be a combination that shares similar traits. The researchers added that people should focus on which diets are easiest to follow and meet their nutritional requirements and food preferences. The study was published online Jan. 9, 2023, by JAMA Internal Medicine.', 'staying healthy', 'images/articles/combination_of_healthy_diets_with_longer_life.jpg', '2023-04-01 17:24:12'),
('Low-carb diet helps cut blood sugar levels in people with prediabetes','For most people, there''s no single healthy way to eat, though there are healthy foods and eating patterns. Yet for people with prediabetes, a low-carb diet could quickly bring elevated A1C levels back to a healthier range, a trial published in JAMA Network Opensuggests.|But while this research revealed several benefits of low-carb eating to blood sugar control, Dr. Giulio Romeo, associate medical director of the Adult Diabetes Section at Harvard-affiliated Joslin Diabetes Center, wonders whether its rigorous approach is realistic in everyday life. "Clearly this study shows that a low-carb — and really, a borderline very-low-carb — diet is effective in reducing A1C levels, which are a measure of blood sugar during the previous three months," he says. "But it may or may not be sustainable in the long run."|Prediabetes affects an estimated 96 million American adults. This condition is characterized by higher-than-normal-range blood sugar levels, and puts people at higher risk for developing full-blown diabetes.', 'nutrition', 'images/articles/lowcarbdiet_prediabetes.jpg', '2023-01-03 17:24:12'),
('Foods you should eat to help fight inflammation','You might be surprised to learn that diet plays an important role in chronic inflammation-- digestive bacteria release chemicals that may spur or suppress inflammation. The types of bacteria that populate our gut and their chemical byproducts vary according to the foods we eat. Some foods encourage the growth of bacteria that stimulate inflammation, while others promote the growth of bacteria that help suppress it.|Here are some of the foods and beverages that have been linked to less inflammation and reduced risk for chronic diseases:|- Fruits and vegetables. Most fruits and brightly colored vegetables naturally contain high levels of antioxidants and polyphenols—potentially protective compounds found in plants.|- Nuts and seeds. Studies have found that consuming nuts and seeds is associated with reduced markers of inflammation and a lower risk of cardiovascular disease and diabetes.|-Beverages. The polyphenols in coffee and the flavonols in cocoa are thought to have anti-inflammatory properties. Green tea is also rich in both polyphenols and antioxidants.|Studies have shown that polyphenols have multiple anti-inflammatory properties. A review published in the British Journal of Nutrition summarized a number of studies supporting the notion that dietary polyphenols may lower inflammation in the body and improve the function of cells that line blood vessels. Foods high in polyphenols include onions, turmeric, red grapes, green tea, cherries, and plums, as well as dark green leafy vegetables such as spinach, kale, and collard greens.', 'nutrition', 'images/articles/foods_to_help_fight_inflammation.jpg', '2022-12-08 17:24:12'),
('Stomach troubles with no clear cause: here''s what you can do','Your stomach doesn''t feel good. It''s not heartburn, but it''s related to eating. Sometimes the discomfort begins during a meal, sometimes about half an hour later. You feel bloated and full or have a burning pain. You''re nauseated, and you might even vomit. You might call it an "upset stomach" or "indigestion." Doctors call it dyspepsia. When common tests can''t identify a cause, the problem is said to be functional dyspepsia. When there is no clear medical solution, diet, exercise habits, adequate sleep, and stress reduction can help.|Eat right|- Avoid foods that trigger symptoms. Common culprits are caffeine, chocolate, alcohol, and spicy, acidic, or fatty foods.|- Eat smaller, more frequent meals so your stomach does not distend and can empty quickly.|- Chew your food slowly and completely.|- Avoid activities that result in swallowing excess air, such eating quickly, chewing gum, drinking carbonated beverages, and smoking.|- Don''t lie down within two hours of eating.|- Keep your weight under control.', 'nutrition', 'images/articles/stomach_troubles_with_no_clear_cause.jpg', '2022-12-07 17:24:12'),
('Probiotics and prebiotics: what''s really important','Probiotics and prebiotics are a hot topic these days. You''ve likely seen many ads on television and online for supplements and foods that promise to deliver helpful bacteria and their benefits. Here''s what you need to know before purchasing these products.|Your large intestine contains 100 trillion "good" bacteria that are essential to health. Called the microbiome, these beneficial microbes help maintain healthy bowel function, and may even help with like inflammatory bowel disease. Research suggests they may even play a role in regulating weight and mood.|Everyone starts with their own unique microbiome at birth. We add to these through the foods we eat.', 'nutrition', 'images/articles/probiotics_and_prebiotics_whats_really_important.jpg', '2022-11-14 17:24:12'),
('Why are you taking a multivitamin?','Are you among the one in three Americans who gulps down a multivitamin every morning, probably with a sip of water? The truth about this popular habit may be hard to swallow.|"Most people would be better off just drinking a full glass of water and skipping the vitamin," says Dr. Pieter Cohen, an associate professor of medicine at Harvard Medical School and an internist at Harvard-affiliated Cambridge Health Alliance. In addition to saving money, you''ll have the satisfaction of not succumbing to misleading marketing schemes.|That''s because for the average American adult, a daily multivitamin doesn''t provide any meaningful health benefit, as noted recently by the US Preventive Services Task Force (USPSTF). Their review, which analyzed 84 studies involving nearly 700,000 people, found little or no evidence that taking vitamin and mineral supplements helps prevent cancer and cardiovascular disease that can lead to heart attacks and stroke, nor do they help prevent an early death.|"We have good evidence that for the vast majority of people, taking multivitamins won''t help you," says Dr. Cohen, an expert in dietary supplement research and regulation.', 'nutrition', 'images/articles/why_are_you_taking_a_multivitamin.jpg', '2022-07-27 17:24:12'),
('The truth about nutrient deficiencies','Strolling past drugstore shelves teeming with dietary supplements might make you wonder: Am I getting enough nutrients? The $35-billion-per-year supplement industry feeds this curiosity with splashy labels and claims, hoping to fuel the belief that we all need to fill a few dietary gaps.|The good news? Most supplements aren''t necessary. It''s also time to think bigger — as in maximizing the mix of foods on your plate.|"People tend to ask about different supplements, but we want them to focus on an overall balanced eating pattern," says Emily Blake, a registered dietitian at Harvard-affiliated Brigham and Women''s Hospital. "Quick fixes are often promoted as a gateway to health, when more sustainable changes are what''s going to move the needle."', 'nutrition', 'images/articles/the_truth_about_nutrient_deficiencies.jpg', '2022-06-01 17:24:12'),
('French fries versus almonds: Calorie for calorie, which comes out on top?','In a perfect world, indulging in a daily portion of French fries instead of almonds would be a simple choice, and no negative consequences would stem from selecting the salty, deep-fried option.|But a Harvard expert says we should take the findings of a new study supporting this scenario with, er, a grain of salt. This potato industry-funded research suggests there''s no significant difference between eating a 300-calorie serving of French fries and a 300-calorie serving of almonds every day for a month, in terms of weight gain or other markers for diabetes risk.|Perhaps snacking on fried potato slivers instead of protein-packed almonds won''t nudge the scale in the short term, but that doesn''t make the decision equally as healthy, says Dr. Walter Willett, professor of epidemiology and nutrition at the Harvard T.H. Chan School of Public Health. Crunchy, satisfying almonds deliver health benefits, including lowering "bad" LDL cholesterol. Over the long haul, they''re a far better option to help ward off chronic illnesses — including diabetes — or delay their complications.|"We''ve learned from many studies over the past two decades that weight loss studies lasting less than a year are likely to give misleading results, so a study lasting only 30 days is less than useless," Dr. Willett says. "For example, studies of six months or less show that low-fat diets reduce body weight, but studies lasting one year or longer show the opposite."', 'nutrition', 'images/articles/french_fries_versus_almonds.jpg', '2022-05-10 17:24:12'),
('Denial: How it hurts, how it helps, and how to cope','At some point in life, everyone experiences denial, a natural response when you''re unable or unwilling to face the facts. Denial is not always a bad thing. But it might be easier to recognize in others than in yourself.|"It''s hard to look at your own life and take a good inventory of what''s going on. It takes a lot of work," says Jonathan Scholl, a therapist and clinical social worker at Harvard-affiliated McLean Hospital.|Here''s a little insight about denial, how to spot it in yourself and others, and what you might want to do about it.', 'mind & mood', 'images/articles/denial_how_it_hurts_how_it_helps_and_how_to_cope.jpg', '2023-07-26 17:24:12'),
('Can a multivitamin improve your memory?','We''re bombarded with advertisements that tout all sorts of health benefits for vitamins and supplements, including improved memory. A May 2023 study of older adults suggests that a daily multivitamin can do just that — improve your memory enough such that it can function as if you were three years younger.|So, should you take that daily multivitamin? Let''s take a close look at the study.', 'mind & mood', 'images/articles/can_a_multivitamin_improve_your_memory.jpg', '2023-07-24 17:24:12'),
('Stomachs growl, noses run, and yawning is contagious: Ever wonder why?','There are certain things our bodies do so often and so automatically that we barely notice them. Yawning, growling stomachs, and runny noses are good examples. Each is a universal part of our daily human experience.|But did you ever wonder why? Below are a few things we know and a few we suspect.', 'staying healthy', 'images/articles/stomachs_growl_noses_run_and_yawning_is_contagious.jpg', '2023-07-19 17:24:12'),
('Creating communities that help support neurodiverse children','We all are different. We all are unique. This is cause to celebrate.|Yet for many children and families, the current landscape of friendships and social spaces can feel unwelcoming. Flexibility and inclusivity are often lacking, leaving little room for children who are neurodiverse, such as those who are on the autism spectrum or who have attention deficit hyperactivity disorder or intellectual disability.|There are many tools and organizations to help children with neurodevelopmental differences practice friendship-building skills and connect through social opportunities. But a larger community effort is needed, as well.|Below are some ways to welcome those who are neurodiverse into your social circle and activities. Friendship is a two-way street, of course, and all of us stand to gain in creating wider, more inclusive circles of friends. Everyone can be a friend; everyone deserves to have friends.', 'child & teen health', 'images/articles/creating_communities_that_help_support_neurodiverse_children.jpg', '2023-07-17 17:24:12'),
('Respiratory health harms often follow flooding: Taking these steps can help','Heavy rains and sea level rise contribute to major flooding events that are one effect of climate change. Surging water rushing into buildings often causes immediate harms, such as drowning deaths, injuries sustained while seeking shelter or fleeing, and hypothermia after exposure to cold waters with no shelter or heat.|But long after news trucks leave and public attention moves on, flooding continues to affect communities in visible and less visible ways. Among the less visible threats is a higher risk of respiratory health problems like asthma and allergic reactions. Fortunately, you can take steps to minimize or avoid flooding, or to reduce respiratory health risks after flooding occurs.', 'staying healthy', 'images/articles/respiratory_health_harms_often_follow_flooding.jpg', '2022-11-09 17:24:12'),
('FDA approves new treatment for advanced prostate cancer','In June, the FDA approved a new treatment for the most advanced type of prostate cancer. Patients who have this condition, which is called metastatic castration-resistant prostate cancer (mCRPC), have few therapeutic options, so the approval helps to fill an urgent need.|mCRPC sets in when the front-line hormonal therapies that doctors use first for treating metastatic prostate cancer stop working. These drugs limit the body''s production of testosterone, a hormone that fuels prostate cancer growth. If they are no longer effective, then doctors switch to a different class of drugs known as anti-androgens that further inhibit testosterone by blocking its cell receptor. One of those drugs is called enzalutamide.|The newly approved treatment combines enzalutamide with a second drug, talazoparib, that was already on the market for female cancer patients who test positive for BRCA mutations. These inherited gene defects boost risks for breast and ovarian cancer, but they can also elevate risks for prostate cancer in men. Indeed, an estimated 10% of men with metastatic prostate cancer are BRCA-positive.', 'staying healthy', 'images/articles/fda_approves_new_treatment_for_advanced_prostate_cancer.jpg', '2023-07-12 17:24:12');

INSERT INTO activities (user_id, age, gender, weight, height, activity_type, duration, intensity, resting_heart_rate, exercise_heart_rate, body_fat_percentage, muscle_mass, water_intake, registered_at)
VALUES 
(1, 30, 'male', 65, 180, 'running', 45, 'moderate', 70, 120, 15.0, 70.0, 1, '2023-07-24 12:34:56'),
(1, 30, 'male', 150, 180, 'running', 45, 'moderate', 70, 120, 15.0, 70.0, 1.5, '2023-04-24 12:34:56'),
(1, 30, 'male', 55, 180, 'running', 45, 'moderate', 70, 120, 15.0, 70.0, 2, '2023-05-24 12:34:56'),
(1, 30, 'male', 45, 180, 'running', 45, 'moderate', 70, 120, 15.0, 70.0, 1, '2023-06-23 12:34:56'), 
(1, 30, 'male', 53, 180, 'running', 45, 'moderate', 70, 120, 15.0, 70.0, 1.8, '2023-07-26 12:34:56');