select * from constituencywise_details
select * from constituencywise_results
select * from states
select * from statewise_results
select * from partywise_results

--- Total_Seats
Select 
Distinct Count(Parliament_constituency) as Total_seats
from constituencywise_results

---What are the total number of seats available for elections in each state
Select 
s.state as State_name,
Count(cr.parliament_constituency) as Total_seats
from constituencywise_results as cr
inner join statewise_results as sr on cr.Parliament_Constituency = sr.Parliament_Constituency
inner join states s on sr.State_ID = s.State_ID
group by s.State

---Total seats won by NDA alliance
Select 
sum(case when Party in (
'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (Secular) - JD(S)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
) Then [Won]
else 0 end) as NDA_total_seats_won from partywise_results


---Seats won by NDA alliance party
select Party as Party_name, Won as Seats_won from partywise_results
where party in (
'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (Secular) - JD(S)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
)
order by Won desc


---Total seats won by I.N.D.I.A Alliance 

select 
sum( case when Party in (
'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK')
then [won] else 0 end) as INDIA_total_seats
from partywise_results

---seats won by I.N.D.I.A Alliance 
select Party as Party_name, Won from partywise_results
where Party in (
	'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK')

Order by Won desc

---Add new column field in table partywise_results to get the Part Allianz as NDA, I.N.D.I.A and Other
 Alter table partywise_results 
 add party_alliance varchar(50)

 Update partywise_results
 set party_alliance = 'I.N.D.I.A'
 where Party in (
 'Indian National Congress - INC',
'Aam Aadmi Party - AAAP',
'All India Trinamool Congress - AITC',
'Bharat Adivasi Party - BHRTADVSIP',
'Communist Party of India  (Marxist) - CPI(M)',
'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
'Communist Party of India - CPI',
'Dravida Munnetra Kazhagam - DMK',
'Indian Union Muslim League - IUML',
'Jharkhand Mukti Morcha - JMM',
'Jammu & Kashmir National Conference - JKN',
'Kerala Congress - KEC',
'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
'Rashtriya Janata Dal - RJD',
'Rashtriya Loktantrik Party - RLTP',
'Revolutionary Socialist Party - RSP',
'Samajwadi Party - SP',
'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
'Viduthalai Chiruthaigal Katchi - VCK')

 Update partywise_results
 set party_alliance = 'N.D.A'
 where Party in(
 'Bharatiya Janata Party - BJP',
'Telugu Desam - TDP',
'Janata Dal  (Secular) - JD(S)',
'Shiv Sena - SHS',
'AJSU Party - AJSUP',
'Apna Dal (Soneylal) - ADAL',
'Asom Gana Parishad - AGP',
'Hindustani Awam Morcha (Secular) - HAMS',
'Janasena Party - JnP',
'Janata Dal  (Secular) - JD(S)',
'Lok Janshakti Party(Ram Vilas) - LJPRV',
'Nationalist Congress Party - NCP',
'Rashtriya Lok Dal - RLD',
'Sikkim Krantikari Morcha - SKM'
)

Update partywise_results
set party_alliance = 'Other'
where party_alliance is Null

Select party_alliance, Sum(Won) as Total
from partywise_results
group by party_alliance

---Winning candidates name, their party name, total vots, and the margin of the victory for a 
---specific state and  constituency?
Select cr.winning_candidate, pr.party, pr.party_alliance,
cr.total_votes, cr.margin, s.state, cr.constituency_name
from 
constituencywise_results as cr inner join partywise_results as pr on cr.party_id = pr.party_id
inner join statewise_results as sr on cr.Parliament_Constituency = sr.Parliament_Constituency
inner join states as s on sr.State_ID = s.State_ID
where cr.Constituency_Name = 'BARAMATI'

---What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
Select cd.EVM_Votes, cd.Postal_Votes, cd.Total_Votes,cd.Candidate, cr.Constituency_name
from constituencywise_details as cd
join constituencywise_results as cr on cd.Constituency_ID = cr.Constituency_ID
Where cr.Constituency_Name = 'ADILABAD'

---Which parties won most seats in the State and how many seats did each party win?
