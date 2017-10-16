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
province_water_level(phayao,0).
```
> Fact about value of water level in each provinces in Thailand.

```prolog
supply_car(vehicle_name).
evac_car(vehicle_name).
boat(vehicle_name).
helicopter(vehicle_name).
```
> Facts about defining vehicle is supply car, evacuation car, boat, or helicopter.

```prolog
vehicle_tolerance_level(vehicle_name, water_level).
```
> Facts about value of highest water level that each cars can tolerate.

```prolog
vehicle_operate_level(stormer, operate_level).
```
> Facts about value of highest water level that each boats can operate.

```prolog
available(vehicle_name, available_amount).
```
> Facts about available amoun of each vehicles.

---

### Rules

```prolog
flood(Province):-province_water_level(Province,Water_level),Water_level>30.
```
```prolog
vehicle_can_drive(X,W):-vehicle_tolerance_level(X,H),H>W.
```
```prolog
vehicle_can_float(X,W):-vehicle_operate_level(X,H),W>H.
```
```prolog
send_evacuation_car(Province,Amount):flood(Province),province_water_level(Province,W),evac_car(X),vehicle_can_drive(X,W),available(X,N),N>Amount.
```
```prolog
send_supply_car(Province,Amount):flood(Province),vehicle_can_drive(X,W),supply_car(X),province_water_level(Province,W),available(X,N),N>Amount.
```
```prolog send_boat(Province,Amount):flood(Province),vehicle_can_float(X,W),province_water_level(Province,W),boat(X),available(X,N),N>Amount.
```

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
