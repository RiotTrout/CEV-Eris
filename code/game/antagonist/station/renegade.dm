var/datum/antagonist/renegade/renegades

/datum/antagonist/renegade
	role_text = "Renegade"
	role_text_plural = "Renegades"
	welcome_text = "Your own safety matters above all else, trust no one and kill anyone who gets in your way. However, armed as you are, now would be the perfect time to settle that score or grab that pair of yellow gloves you've been eyeing..."
	id = ROLE_RENEGADE
	flags = ANTAG_SUSPICIOUS | ANTAG_IMPLANT_IMMUNE | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	hard_cap = 5
	hard_cap_round = 7

	hard_cap = 8
	hard_cap_round = 12
	initial_spawn_req = 3
	initial_spawn_target = 6

	var/list/spawn_guns = list(
		/obj/item/weapon/gun/energy/gun,
		/obj/item/weapon/gun/energy/laser,
		/obj/item/weapon/gun/projectile,
		/obj/item/weapon/gun/projectile/revolver/detective,
		/obj/item/weapon/gun/projectile/automatic/c20r,
		/obj/item/weapon/gun/projectile/clarissa,
		/obj/item/weapon/silencer,
		/obj/item/weapon/gun/projectile/shotgun/pump,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat,
		/obj/item/weapon/gun/energy/crossbow
		)

/datum/antagonist/renegade/New()
	..()
	renegades = src

/datum/antagonist/renegade/create_objectives(var/datum/mind/player)

	if(!..())
		return
	new /datum/objective/survive (player)


/datum/antagonist/renegade/equip(var/mob/living/carbon/human/player)

	if(!..())
		return

	var/gun_type = pick(spawn_guns)
	var/obj/item/gun = new gun_type(get_turf(player))
	if(!(player.l_hand && player.r_hand))
		player.put_in_hands(gun)
