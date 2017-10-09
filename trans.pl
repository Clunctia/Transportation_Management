
% Northern
province_water_level(chiang_mai,0).
province_water_level(chiang_rai,0).
province_water_level(lampang,8).
province_water_level(lamphun,11).
province_water_level(mae_hong_son,0).
province_water_level(nan,0).
province_water_level(phayao,0).
province_water_level(phrae,3).
province_water_level(uttaradit,2).

% North-Eastern
province_water_level(buriram,21).
province_water_level(loei,60).
province_water_level(nakhon_ratchasima,40).
province_water_level(nong_khai,61).
province_water_level(roi_et,33).
province_water_level(ubon_ratchathani,12).

% Middle
province_water_level(ang_thong,33).
province_water_level(bangkok,4).
province_water_level(nonthaburi,7).
province_water_level(pathum_thani,30).
province_water_level(phichit,77).

% Eastern
province_water_level(chonburi,11).
province_water_level(rayong,7).

% Western
province_water_level(kanchanaburi,20).
province_water_level(tak,0).


% Southern
province_water_level(nakhon_si_thammarat,55).
province_water_level(narathiwat,35).

supply_car(toyata_hilux_vigo).
supply_car(izuzu_demax).
supply_car(humvee).

evac_car(m35a2c).
evac_car(ashok_leyland).

boat(stormer).
boat(palfinger).
boat(alumarine).
boat(polaris).

helicopter(bolkow_kawasaki_117).

vehicle_tolerance_level(toyota_hilux_vigo,70).
vehicle_tolerance_level(izuzu_demax,70).
vehicle_tolerance_level(m35a2c,180).
vehicle_tolerance_level(ashok_leyland,200).

vehicle_operate_level(stormer,40).
vehicle_operate_level(alumarine,20).

available(toyota_hilux_vigo,100).
available(izuzu_demax,80).
available(humvee,50).
available(ashok_leyland,20).
available(stormer,30).
available(bolkow_kawasaki_117,5).
available(m35a2c,5).
available(palfinger,5).
available(alumarine,5).
available(polaris,5).


flood(Province):-province_water_level(Province,Water_level),
Water_level>30.
vehicle_can_drive(X,W):-vehicle_tolerance_level(X,H),H>W.
vehicle_can_float(X,W):-vehicle_operate_level(X,H),W>H.
send_evacuation_car(Province,Amount):-flood(Province),province_water_level(Province,W),evac_car(X),vehicle_can_drive(X,W),available(X,N),N>Amount.
send_supply_car(Province,Amount):-flood(Province),vehicle_can_drive(X,W),supply_car(X),province_water_level(Province,W),available(X,N),N>Amount.
send_boat(Province,Amount):-flood(Province),vehicle_can_float(X,W),province_water_level(Province,W),boat(X),available(X,N),N>Amount.
