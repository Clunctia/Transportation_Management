
## Transportation management during flood using expert system

### Group Members
- 5810545033  Nuttapong   Rojanavanich
- 5810545386  Chayanin		Punjakunaporn
- 5810545491  Sorawish		Laovakul
- 5810545840  Keetawat		Srichompoo
- 5810546552  Kamontat		Chanthrachirathumrong
- 5810546579  Kasidid		  Pholwannabha
- 5810546684  Napon		    Kittisiriprasert

---

### Facts

```prolog
province_water_level(province_name, water_level_value).
```
- Fact about value of water level in each provinces in Thailand.
- Ex.: province_water_level(phrae,3).

```prolog
supply_car(vehicle_name).
evac_car(vehicle_name).
boat(vehicle_name).
helicopter(vehicle_name).
```
- Facts about defining vehicle is supply car, evacuation car, boat, or helicopter.
- Ex.1: supply_car(toyata_hilux_vigo).
- Ex.2: evac_car(m35a2c).
- Ex.3: boat(stormer).
- Ex.4: helicopter(bolkow_kawasaki_117).

```prolog
vehicle_tolerance_level(vehicle_name, water_level).
```
- Facts about value of highest water level that each cars can tolerate.

```prolog
vehicle_operate_level(stormer, operate_level).
```
- Facts about value of highest water level that each boats can operate.
- Ex.1: vehicle_tolerance_level(toyota_hilux_vigo,70).
- Ex.2: vehicle_tolerance_level(izuzu_demax,70).

```prolog
available(vehicle_name, available_amount).
```
- Facts about available amoun of each vehicles.
- Ex.1: available(toyota_hilux_vigo,100).
- Ex.2: available(izuzu_demax,80).

---

### Rules

```prolog
flood(Province):-province_water_level(Province,Water_level),Water_level>30.
```
- If the water level is higher than 30 cm in the specified province flood returns true
- Ex. for true answer: flood(bangkok).
- Ex. for false answer: flood(pichit).

```prolog
vehicle_can_drive(X,W):-vehicle_tolerance_level(X,H),H>W.
```
- Returns true if the specified water level with the vehicle's level of water it can drive normally
- Ex. for true answer: vehicle_can_drive(humvee,40).

```prolog
vehicle_can_float(X,W):-vehicle_operate_level(X,H),W>H.
```
- Returns true if the specified water level with the vehicle's level of water it can float normally
- Ex. for true answer: vehicle_can_float(stormer,30).

```prolog
send_evacuation_car(Province,Amount):-flood(Province),province_water_level(Province,W),evac_car(X),vehicle_can_drive(X,W),available(X,N),N>Amount.
```
- Calculate and returns available evacuation car that can be sent to the province
- Ex.: send_evacuation_car(ang_thong,2).

```prolog
send_supply_car(Province,Amount,X):-flood(Province),vehicle_can_drive(X,W),supply_car(X),province_water_level(Province,W),available(X,N),N>Amount.
```
- Calculate and returns available supply car that can be sent to the province
- Ex.: send_supply_car(bangkok,5).

```prolog
send_boat(Province,Amount,X):-flood(Province),vehicle_can_float(X,W),province_water_level(Province,W),boat(X),available(X,N),N>Amount.
```
- Calculate and returns available boat that can be sent to the province
- Ex.: send_boat(chiang_rai,1).

```prolog
flood(Province):-province_water_level(Province,Water_level),
Water_level>30.
```

```prolog
vehicle_can_drive(X,W):-vehicle_tolerance_level(X,H),H>W.
```

```prolog
vehicle_can_float(X,W):-vehicle_operate_level(X,H),W>H.
```

```prolog
send_evacuation_car(Province,Amount,X):-flood(Province),province_water_level(Province,W),evac_car(X),vehicle_can_drive(X,W),available(X,N),N>Amount.
```
- Ex.: send_evacuation_car(chiang_rai, 100, X).

```prolog
send_supply_car(Province,Amount,X):-flood(Province),vehicle_can_drive(X,W),supply_car(X),province_water_level(Province,W),available(X,N),N>Amount.
```
```prolog
send_boat(Province,Amount,X):-flood(Province),vehicle_can_float(X,W),province_water_level(Province,W),boat(X),available(X,N),N>Amount.
```
