function [Y,Xf,Af] = annfn(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 20-Feb-2017 18:11:03.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timsteps
%   Each X{1,ts} = 7xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1_xoffset = [1.19178082191781;0;18;1.8;2.727272727;50.4;34.9];
x1_step1_gain = [0.0537317827175033;0.0833333333333333;0.000135897261670177;0.571428571428571;0.0804416980502347;0.075187969924812;0.00847816871555744];
x1_step1_ymin = -1;

% Layer 1
b1 = [-2.6173888894401207;-2.6320584048167288;2.5800569670974536;-2.4209041177400645;-2.5511904318897218;-2.4289907713467707;-2.377514250330548;2.3372697457513278;-2.2032215319553803;2.062826699027605;2.3520932975236719;-2.0629226067759645;2.035606549370037;2.124621199654964;-2.0083227935112169;-2.0071870001668373;-1.8711735770447553;-1.7994629223892282;1.7038883927331172;-1.6367667494460583;1.605153533152728;-1.4729881073793401;1.5793674604549712;-1.4178995853476772;1.4370265713533557;-1.2740777145879654;1.248574732409431;-1.2254284776586322;-1.194413484456234;1.2719451641916839;-1.2030455240445861;-1.2638523094525633;-0.91159742540655575;0.83169003325507973;0.83344905689374271;-0.85706514852798077;-0.75209877650233314;-0.52053368136138933;-0.63699047923893892;-0.44617132484405581;0.52192839286645654;0.427001180905758;-0.39316465549134133;-0.35294445826154297;-0.35424041369936321;0.2107245453828952;-0.26720219148275659;-0.066494999453928907;-0.097487009411102832;0.09713363855384749;-0.0030084833270354293;-0.25447706981062473;-0.13619093085176978;-0.28993612286275189;-0.21767871248964921;-0.37313098682900186;-0.093420827419062158;0.48766912127014989;0.45880339417638116;0.61317010648509096;-0.45197375030910314;-0.56527271886522434;-0.83993158327525119;0.76932924476521358;-1.0046155406785326;0.91895232931898641;-0.88332667467929327;0.94209163348431779;-1.0048173806519256;1.1543723252287399;0.94047118170246635;-1.2972635451093659;1.1137076225006068;-1.2091292252097565;-1.315916194485627;1.29188277374894;1.3694620716740162;1.4975719493639492;-1.5599235111785323;1.5416387759022068;1.6291391778890769;1.7523419750009477;-1.795976955014345;-1.7314321234034757;-1.8828969969754796;1.8889045341084756;1.9829422102091923;-2.0891089249877814;2.3640417485332619;-2.1629912076374325;-2.3624707017246025;-2.2896485539525639;-2.2568619536802679;-2.510461375181964;2.3930940732509334;-2.5138378845521494;2.5461821849292985;-2.4429828423416544;-2.5731673324430937;-2.709595819350592];
IW1_1 = [0.88226663512691117 0.70831625126140729 -0.70340404558069136 -0.55322492033057746 -1.1613306652600586 -1.8956286269215588 -0.79887907506599654;0.36666595717533063 1.2246815158871758 1.516661617992922 0.43000131806434455 0.40961285288903537 1.5495669004234192 0.80741333952321293;-0.72659013560003882 -1.1872052228456362 -0.7949480960216827 0.60128424288615134 -1.4714439343799421 -1.4903051754765269 -0.23097778760177903;0.83908732071611269 -1.0902756789273274 -1.3685263333730808 1.1268185202943717 -0.15180822609148445 1.6752834967755335 -0.51416045463230209;0.06341139844218438 -1.3605865902995442 -1.3218831259249395 1.2927835065224338 0.94894144818890813 -0.22167094474746812 -0.7956647482205218;0.54735538677901652 -1.1284476378855199 -0.67677351672930253 1.4407401445969648 0.77719921608581644 -1.5812922723776346 0.299585789762219;1.04702912481653 0.73144129582929041 1.3009420862073864 -1.1905258283197135 -0.7191260181265291 -1.1323732448408697 0.87000774725007313;-0.67333165234077275 1.6226962944108689 0.51560870809035464 0.14017941600317047 0.91508198739211299 -0.44508947016409306 -1.7299258010933651;0.24836066533010182 0.57182883558786135 -1.0898628574775413 -1.5595868443232876 1.4004738205828009 0.089606931925277536 -1.2365070296378267;-1.8046981854314417 -0.15402843719417911 -0.60798895359155791 1.1703292952492625 1.5537538839512524 -0.65585260021009006 0.16100741451976641;-0.58313905720049153 0.58702475781698371 -0.4820877291462442 -0.334090653895456 1.4383861364995032 -1.5031840993640779 1.2064908853602028;0.88924858324527423 -1.4351066979087108 1.2641200042258687 -0.75641874991631053 -1.0912735421927737 0.73172798679347995 -0.61858773537699763;-0.80670536956393668 1.5512220390544806 0.043451948130393506 -0.94349878355937777 1.4595927478153592 -0.69334948845006705 -0.89587430693634929;-1.4368030526442082 0.69172549398930316 0.11719655748613911 -1.1020919739465223 0.79345509127603364 0.56259676953210602 -1.4911484849418604;0.72756128275017529 -1.1337083561102743 0.9701530613075704 -0.90172933756678353 0.74533913401090046 -1.0532567114408418 -1.3609682425850371;0.9371845375757023 -0.043277703164091456 -0.92797918026234161 2.0623982707693078 0.093458399468588055 0.67487555174700253 0.46714893935382729;0.55994053254552023 0.12180210144203062 -1.403281952784281 1.2270044117480059 -0.65300694449332264 -0.28572627097532549 1.8940601257227105;1.4827758955633452 0.37062681645501333 1.2121185013430127 0.92360491985861448 -1.3981431584153847 0.65119186066812484 -0.49792803125703367;-1.0859604468620156 1.5322665547038856 -1.3678090671824448 -0.75785636999476913 -0.13825618509497656 -1.0568976652704343 -0.47765044494966347;0.36285787575410794 0.23189195967619947 -1.1592137502749451 -1.1179509139746602 -1.2189101331528207 1.1361897449011253 -1.2113720155590628;-0.48465839654606135 0.33173037777358305 -0.77932639234774714 -1.8634198909863888 -0.83676208609058522 -1.3913556505615281 -0.47203887258725474;0.54216547907575185 1.4355524231884662 1.0776022486016197 -0.61061596989324962 -0.44144557024379993 -1.2586624791562211 1.3008041260278389;-0.66117491133255779 -1.3396486757460402 -0.046125952226028069 0.19287651766711827 1.117957122295981 0.95323339789934269 -1.5254187628148281;0.60344457290706 0.66078692356302526 -0.71321537139290658 0.489135011591316 -1.2488840677910977 1.5807670642721035 -1.3321901526575091;-0.6272066848709813 -1.7085896164446288 -0.19581877545324053 0.29949154082154655 0.68577284759217128 -1.0987656660209768 1.3865560262569292;1.6523004431929507 0.30963786863442289 0.51149141293867439 -0.88306614567672959 -0.19666364705121181 0.37183729299951296 -1.6937554949344482;-0.48352891685052851 1.2922426835374414 0.34812987596199696 -0.36918557427894871 -1.2870612951152531 -1.8499431956749202 -0.13187468749669384;0.54471086781580891 -1.4720233777889458 1.0289248595105291 -0.66487215289388857 -1.4413793581203023 -0.66029986116498218 1.0348732978599977;0.78736282316464357 0.075812428614184926 -1.2571693404353108 1.2312549514763513 0.64745276178754108 1.2631457069437118 1.3529315784950584;-1.497210113694964 -0.77990297504858452 -1.3031485738841104 1.0169329929761419 -0.95632810101731913 0.78145014237093902 -0.0062243493198333097;0.59215542601183835 0.59102126338300054 0.89459471752569919 1.4241607344765426 1.2151253543116634 -0.11506200375516096 1.4366588540220731;1.898025794351681 0.52191796868765628 -0.17099600491653316 -0.57720293031167724 0.84603525064997342 -1.1180003196969648 0.60290472930681338;0.85764426175735531 -1.6076590078503694 -0.6825698597092279 0.91095220330308901 -0.79618457039251633 -1.0675499447803578 1.0107735306473562;-0.96397225375999207 1.0449851231974141 -1.2605289068009506 -1.3667402017569901 0.9639133898672545 -0.78462470715791499 -0.57256381363231135;-1.0370075603980073 1.2203889569661299 -0.51040861673558002 1.2517928817135147 1.0756521853916476 0.72168236382354578 -1.0839718888073913;1.5910599445242906 -1.7427230704206074 -0.30123470559578919 0.81869069201860989 0.55446110610858956 -0.54172283329302007 0.87360999698698893;1.5053188726755529 -1.3441838816631035 0.39069932632609694 -0.69960517519183929 1.0233398729104917 1.0086224298699578 0.75496706834988714;1.0188163681222036 2.0822115885807708 -1.2041574713504681 0.7781823904668419 0.021759414979934527 0.13910458605839401 -0.38376766667740775;1.4210301788348136 -0.24511979356887123 1.2462043137118157 -0.078192547493273784 1.1735373860817329 -1.4266116622961369 -0.54594349817380372;0.1856292315239278 0.61916077003084924 0.85227705346385207 1.0019198774602867 -1.2307386407991583 -1.4390160860253787 -1.0300767822627026;-0.11161249423185478 1.3492220351934254 1.3601677333988709 -0.55369204292338947 1.1081136108317757 1.3919369912257373 -0.41056521329537815;-1.5495136454280993 1.3588650524331478 0.27494969752646631 0.35442497665974482 -1.4258311235900567 0.43227009177108844 -0.51582146543751262;0.30830316938455332 1.414275479006103 -0.65641243937121241 -0.78573508228645628 -1.0841297071877527 1.5742489347372683 -0.69001751559062596;1.0322677749819684 -0.74848486658804458 0.97202851395660494 -1.3362120867798415 0.83320898464972937 -0.087193524190959354 1.5098455488923832;1.2172662813059971 0.69256864931047135 0.062253058234459674 -0.96262406318524363 -1.0340727299182211 1.7205467321782324 0.59705246974313109;-1.0910813210032693 1.8178969359125161 0.57132959364545977 -0.47578684955677752 1.3847904991106939 0.30691177996839669 -0.25053660556025198;0.78610494858745616 1.3889248538254475 0.81357257835410179 0.70611913166684948 1.4387061292445573 -1.0511283863224878 0.50337333969215625;0.57375856318336604 1.0339580662148147 -1.144777126762357 -1.5233353571818715 -1.0653566554989911 -1.2310738354373016 0.41763978674436619;1.3206347615234559 -1.3325333005034679 0.61348571617033487 0.50652911849424509 0.65833358365038985 -1.0370395984959297 1.3000833485708623;-0.42840921720034153 1.6597890011333252 -0.92773799127627776 -0.83634756624223294 0.45906821486077215 1.1762094175025033 1.1758807976596759;-1.565118167166162 0.46982673113334728 -0.95915520423681577 1.2030301652168578 0.0029870404234611805 -1.2603916501335175 0.73660951744135938;-0.52115440270946345 0.12120628854219841 -0.60460465199064972 0.24312917774325607 1.8032906238532913 -1.211397298967994 1.4614538032952022;-0.73216394574443699 0.90473071691596774 -0.8426554838345276 -0.15572935766899951 -1.2138452137444522 -0.39346115409597798 -1.9026106664639417;-0.17560529057265467 -0.02824625474260458 -1.2309033999292887 -1.7214318775339696 -1.5043020172276682 -0.89161734786752966 0.37527127173880337;-1.3182602296664427 1.1036277726101886 -1.1984142763041092 -0.7172425686527224 0.48518537671260464 -0.099194137354361417 1.4534599424724126;-1.4460771621565534 -1.3944896432329024 0.88304557390884519 -0.3465802277038178 0.91305572462635409 -1.3973363112387378 0.034401032324865202;-1.2766241303775212 0.69934099915372894 -0.87048987213420792 1.3630937755265113 -0.70659145515306299 -0.96084404774198973 -1.3290552815812717;1.2634588922385879 0.47011052766785166 -0.97083744023788998 -0.040962839255819158 1.8764061947374953 0.5420033478135281 0.35985584894867406;1.2322876333093566 0.071328237321691718 0.17089488318287649 -1.1645383890826049 -1.6128440137272939 0.99568860206289544 -0.79996148108655929;0.35315211282816361 -0.89390130535936163 -1.7865672497628895 1.4747020614929216 -0.73247814241253761 -0.50098558948398675 -0.24329237824799063;-0.6632774256074061 1.7902583800245371 1.0601017005695477 -0.23091647271821369 0.3153263483751898 -0.63066170201602356 -1.5539865995948712;-0.59633930836938509 1.0754350219474307 -1.2232392386238224 0.9041193565561304 -1.1357841655571936 0.9459501591321221 -1.0332065083131903;-1.7789303156347953 0.42909010415016113 -0.57967208305419726 -0.72550906932473713 -1.2128923283057194 0.7239053206738203 1.0737701311212204;1.2236414939540272 -1.4459414258761369 -0.53741429053960255 1.14962952216658 -0.9655447626489877 -0.10394486320909575 -0.74598565084256707;-0.80893005182073252 -0.12887122353305375 0.83902251106536341 -1.4229664344554411 1.4459086067286313 -1.1822138669766022 0.085844724544073103;1.3044343166146053 0.057439593741712508 0.49835383590828608 -1.0702218427094499 1.2798806829879847 -1.4120800853689666 0.13426413729470307;-0.93145412350200119 -1.1323640253452798 0.50104718258389647 0.99322716450321435 -1.134331529641581 0.90745278953750208 -1.2203553676607761;0.17019413986245996 -0.54459160947649965 -1.0698098826283808 0.9613375282260489 -1.2172944229422207 -0.37541287259889783 1.8247847542804316;-0.41526441766148464 1.0760329401719395 1.8595066323547287 1.526992586725116 0.37094926065603639 0.41215816520693788 -0.15666361478509225;0.74883996710046263 0.97550800580911401 -0.84411900823182773 0.31071940681289861 1.5668914123910578 -0.0053392871691603297 1.4486189353692085;1.2053443864101678 -1.0490897814198696 0.31309012847871542 0.21706314730781112 1.5831490530081931 1.4774066356567408 0.29801303086862962;-0.31607129874821188 -0.48252791331362155 -1.2785650568435845 0.84423474341590654 0.55573994966665263 -1.2913747663939352 1.4118339894068841;1.3196003147710234 0.80870588114515829 1.2982304421326432 1.2669519487710306 1.2425777260576034 -1.1852534118912306 -0.6820620758208128;-1.2304771033287976 -0.69594939861180027 -0.78653586230779315 1.2351045271328809 -0.42333673220541013 -1.3261838670626795 -1.1648500760241463;-1.5593493768168691 0.30963806702933627 -1.1742898211679662 0.92573098611732707 -0.84767767425604978 -1.1997012654148382 -0.87608059684707074;1.362938080802288 -1.5587545260082825 -0.47004374758373985 0.57224970371772055 0.24645544262506913 0.434275575506474 -1.5507925464112409;1.6015647589535604 0.67999420755157025 1.6828817894664705 -0.38876338110262848 0.43516336264266098 -0.14624865063164591 -1.2249592777548652;0.29138995587913591 0.97971731586681798 -0.90404101538370485 -1.3876045691297236 -0.66934726248758991 1.326865053881934 1.1400902340592098;-1.5516273051108693 0.71153638015387122 -0.77920060697109228 -1.0230062848717221 1.3161647266761831 -0.2814002906110325 0.92282605354943714;1.2618512629662293 -0.52706970866415526 0.0039480657077745973 -1.4191082486456623 1.0905385668061058 1.1239065433837965 1.2264708156598634;1.4531396631487721 -0.039003850531234147 0.65163036645672123 -0.45534613749465447 0.75966114742260216 0.89844573897079916 -1.7999975756593682;0.3189862786755997 -0.77179988659247911 -0.42033290891911856 1.3971912118947418 0.70708068822046166 1.528690553830391 -1.2667467004641979;-0.17973553865307365 -0.98682116475587589 0.77017361116789496 -0.83531261901860965 -0.95569069796491424 -0.07050824398866759 2.000122401815414;-1.2892115919591332 0.99417736145827984 -1.3024276638581402 1.3416352226865584 -1.2803133083865703 -0.18139126295266583 0.079274770161034472;-0.4898961156362196 0.23086281474254977 -1.6967301485529025 -1.4374253138148252 -1.1327902270488819 0.033905364374201608 1.0935117534618031;1.0310346685619365 0.10654627402609107 -2.0121570021561443 -0.95846323577395875 0.80057307130510236 0.03061768598928143 -0.74719977282249428;0.098554084195447131 2.0572991864729722 0.22812236408546763 -0.33651745499296754 -0.67925187657462471 -0.13978068357822551 -1.5684010143463814;-0.080348483759092454 0.95269693702029512 1.4949705216093374 -0.95915173692173394 0.48505721652266232 1.6885099930412399 0.031148355865959154;1.2248700904425243 0.55998281864212529 0.28051824530427527 1.0838027959558552 0.91756070590270589 1.4326654112485613 -0.42798842581675972;-1.5991267104870837 0.96827322492465528 0.089845609100929993 -0.87388976716573297 0.78595964776547267 -0.67167038709469618 1.3765334144366186;-1.0409463152317329 -0.015049788231170157 0.79227303643952873 1.2544946113332336 1.0078453959228646 0.78105279828315677 -1.3077331660998142;-1.4274821805383713 -1.1668982869193023 -0.12445465351382734 -0.06527665299750994 -1.0648583856963489 1.2606826972999694 -0.91392071131169983;-1.7240422616576869 -0.0084639735532897158 -0.77013928575959245 -0.90160908436961795 -1.0723191986704119 -0.74423483540476187 -1.0099466200818228;-0.59548025108434621 1.0933587368424338 0.62650453839277342 0.85246974958225752 -0.037988716281197335 -1.2100349351209412 1.5277608532351112;1.1137581708132673 -0.33787792667292482 0.3151713188083316 1.0777772068433662 1.4046628892440967 -1.2954429310040061 0.63678985573096525;-1.1508374568694721 -1.030419425302461 0.98539412118772651 1.4230971742010559 0.15119904586451005 0.84046648963002601 -1.042401222083035;1.7355880893196891 0.15475380477435485 -0.94946115148463717 0.7075411274674509 -1.5774886136282611 0.11631395524636262 0.58331734565783488;-1.293893348523234 -0.33235853511785551 -1.0383347410319157 1.5849205080453752 1.0961764395653497 -0.10119816630529177 -1.0983529847336084;-0.10569667080829007 0.9700376466034496 -1.7478271060339863 1.3473261227290174 0.97793707318990863 1.0176689703875457 -0.18825172276043767;-0.47899745751116662 0.96967486123424795 -0.77295106089550125 1.4217799262019322 0.029351887643038171 -1.0221140643908615 1.5748655346938774];

% Layer 2
b2 = -0.23628422588985792;
LW2_1 = [-0.31153469884033008 -0.67944152177701167 0.25448819733775618 -0.48814186408635202 -0.66829483494353248 -0.53857706241142178 0.033073783956262766 0.38326012770303652 -0.099709331140060628 -0.55596557837813598 -1.0304414365239731 0.61628926131997264 -0.39787338663975569 -0.26024635724752448 0.7572463610478295 -0.49776215221784159 0.65840612941294441 -0.068439086111576564 -0.40735762446378487 0.37495495319788485 0.060793000080830266 0.22308947057469217 0.22196987587392281 -0.056680420316525398 0.049167132422295846 -0.19242008206460301 0.086541952965536337 -0.62070758515852953 0.82717808697886164 -0.50802113154929907 0.4588383299344248 0.15421134115970711 -0.33195639267411592 0.27429083899533768 0.072260597831523429 0.97101535007863993 0.33947016356717052 0.39045704784368285 -0.18674181611041021 -0.59732443971071925 -0.10605205718167818 0.58764063970979763 0.25136035359432318 -0.16528157854357983 0.2750772163593318 -0.37906118683777357 0.063052727558657956 -0.68977162725899488 0.35482883582195718 -0.80279758700701886 -0.047078962015717471 0.69387915265599243 0.19477917515210472 0.6370187307058921 -0.056695894200458619 -0.70420522447518763 0.78660440608781745 0.35989182806533726 0.17417564350488779 0.19383929197717004 0.57155029415254333 -0.67581255648818639 0.58199631879974789 0.33958197299387716 -0.30683322679737091 0.15851437832725093 -0.11313192442769457 -0.23190067484218535 -0.33250163343349709 -0.31506957744595904 0.31722754496394862 -0.44900424269794964 0.73934640322016043 -0.35779085413517231 0.2670228955151327 -0.37396501724986875 0.27319198892392399 0.67835578357155468 0.11444840548185893 -0.76207048990237447 -0.34585115691356805 0.34573551560249627 0.18501461545064307 -0.38072728456005678 -0.31061116799714855 -0.69513560919609929 -0.31794287409442185 -0.30391460514164359 -0.48531909932890366 -0.070444640899494954 -0.66624648795535779 -0.64849650929408154 0.29333077998520385 -0.52196508998422586 -0.39763325982880388 0.54750374912077993 0.1197746873180946 0.84414539154451862 -0.38726921527900854 0.27012947230850876];

% Output 1
y1_step1_ymin = -1;
y1_step1_gain = 4;
y1_step1_xoffset = 0.1;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX, X = {X}; end;

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
y = bsxfun(@minus,x,settings_xoffset);
y = bsxfun(@times,y,settings_gain);
y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
x = bsxfun(@minus,y,settings_ymin);
x = bsxfun(@rdivide,x,settings_gain);
x = bsxfun(@plus,x,settings_xoffset);
end
