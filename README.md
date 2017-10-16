
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
Ex:
province_water_level(phrae,3).
```
> Fact about value of water level in each provinces in Thailand.

```prolog
supply_car(vehicle_name).
Ex:
supply_car(toyata_hilux_vigo).

evac_car(vehicle_name).
Ex:
evac_car(m35a2c).

boat(vehicle_name).
Ex:
boat(stormer).

helicopter(vehicle_name).
Ex:
helicopter(bolkow_kawasaki_117).
```
> Facts about defining vehicle is supply car, evacuation car, boat, or helicopter.

```prolog
vehicle_tolerance_level(vehicle_name, water_level).
```
> Facts about value of highest water level that each cars can tolerate.

```prolog
vehicle_operate_level(stormer, operate_level).
Ex:
vehicle_tolerance_level(toyota_hilux_vigo,70).
vehicle_tolerance_level(izuzu_demax,70).
```
> Facts about value of highest water level that each boats can operate.

```prolog
available(vehicle_name, available_amount).
Ex:
available(toyota_hilux_vigo,100).
available(izuzu_demax,80).
```
> Facts about available amoun of each vehicles.

---

### Rules

```prolog
flood(Province):-province_water_level(Province,Water_level),Water_level>30.
```
> If the water level is higher than 30 cm in the specified province flood returns true

> Ex. flood(ang_thong).

> Ex. flood(pichit).
```prolog
vehicle_can_drive(X,W):-vehicle_tolerance_level(X,H),H>W.
```
> Returns true if the specified water level with the vehicle's level of water it can drive normally

> Ex. vehicle_can_drive(humvee,40).
return true
```prolog
vehicle_can_float(X,W):-vehicle_operate_level(X,H),W>H.
```
> Returns true if the specified water level with the vehicle's level of water it can float normally

> Ex. vehicle_can_float(stormer,30).
return true
```prolog
send_evacuation_car(Province,Amount):flood(Province),province_water_level(Province,W),evac_car(X),vehicle_can_drive(X,W),available(X,N),N>Amount.
```
> Calculate and returns available evacuation car that can be sent to the province

> Ex. send_evacuation_car(ang_thong,2).
```prolog
send_supply_car(Province,Amount):flood(Province),vehicle_can_drive(X,W),supply_car(X),province_water_level(Province,W),available(X,N),N>Amount.
```
> Calculate and returns available supply car that can be sent to the province

> Ex. send_supply_car(bangkok,5).
```prolog send_boat(Province,Amount):flood(Province),vehicle_can_float(X,W),province_water_level(Province,W),boat(X),available(X,N),N>Amount.
```
> Calculate and returns available boat that can be sent to the province

> Ex. send_boat(chiang_rai,1).

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
send_evacuation_car(Province,Amount):-flood(Province),province_water_level(Province,W),evac_car(X),vehicle_can_drive(X,W),available(X,N),N>Amount.
```
```prolog
send_supply_car(Province,Amount):-flood(Province),vehicle_can_drive(X,W),supply_car(X),province_water_level(Province,W),available(X,N),N>Amount.
```
```prolog
send_boat(Province,Amount):-flood(Province),vehicle_can_float(X,W),province_water_level(Province,W),boat(X),available(X,N),N>Amount.
```
