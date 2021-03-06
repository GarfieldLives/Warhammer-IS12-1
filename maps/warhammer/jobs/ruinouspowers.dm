/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Khorne////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/khorne(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Khorne"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot call upon Khorne while restrained!")	//user is tied up
		return
	if(decay > 0)
		to_chat(M, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(M, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(M, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(M.rage)
		if(0)
			if(istype(M.l_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.l_hand)
				to_chat(M, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. You have taken the first step on the path of the Blood God. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				M.update_inv_l_hand()
				M.rage++
			else if(istype(M.r_hand, /obj/item/reagent_containers/food/snacks/khornemeat))
				qdel(usr.r_hand)
				to_chat(M, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. You have taken the first step on the path of the Blood God. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/khorne.ogg', 50, 0, -1)
				M.update_inv_r_hand()
				M.rage++
			else
				to_chat(M, "You need a certain type of meat... Something filled with rage and a lust for bloodshed.")
				return
		if(1)
			to_chat(M, "Strength and fury fills your muscles. A feeling begins to grow in your gut, you must fight, you must kill, you must be victorious.")
			STAT_LEVEL(str)+=1
			M.rage++
			M.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
		if(2)
			M.verbs += /mob/living/carbon/human/proc/khornerune
			to_chat(M, "Hatred, rage and fury like you've never known consume your mind and block out your every thought. Flashes of a symbol appear in your mind. You feel compelled to draw it.")
			M.rage++
		if(3)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(T)
				M.rage++
				to_chat(M, "This... is it. That symbol. Just the sight of it quickens your heart and pumps adrenaline through your veins. You can hear his voice more clearly now.")
			else
				to_chat(M, "I must draw his symbol and stand upon it!")
				return
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Nurgle////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/nurgle(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Nurgle"
	set desc = "In the embrace of great Nurgle, I am no longer afraid."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot call upon Nurgle while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(M, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(M, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(M, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(M.decay)
		if(0)
			if(istype(M.l_hand, /obj/item/reagent_containers/food/snacks/poo))
				qdel(usr.l_hand)
				to_chat(M, "As if commanded, you raise the feces to your lips. You take a small bite followed by a much larger one. You thought it would be disgusting, but it is actually the most incredible thing you've ever tasted. As it enters your stomach you feel it changing you, the lord of flies voice jovially rings out in your ears. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/fornurgle.ogg', 50, 0, -1)
				M.update_inv_l_hand()
				M.decay++
			else if(istype(M.r_hand, /obj/item/reagent_containers/food/snacks/poo))
				qdel(usr.r_hand)
				to_chat(M, "As if commanded, you raise the feces to your lips. You take a small bite followed by a much larger one. You thought it would be disgusting, but it is actually the most incredible thing you've ever tasted. As it enters your stomach you feel it changing you, the lord of flies voice jovially rings out in your ears. You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(src, 'sound/effects/fornurgle.ogg', 50, 0, -1)
				M.update_inv_r_hand()
				M.decay++
			else
				to_chat(M, "For some reason you have always been drawn to disgusting things. Find the most vile thing you can think of and hold it in your hand.")
				return
		if(1)
			M.decay++
			STAT_LEVEL(end) +=1
			M.verbs -= list(/mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			to_chat(M, "The voice of gentle grandfather fills your inner mind. You cannot see him, but you feel the warmth of his smile. It is calming, it is pleasing. You want to listen to what he has to say, to sit like a child before a wise elder telling tales of his youth.")
		if(2)
			M.decay++
			M.verbs += /mob/living/carbon/human/proc/nurglerune
			to_chat(M, "He tells you story after story, some make you laugh, some make you cry and some make you stare in wonder. Before he departs he fills your mind with a symbol. It is quite pleasant. Maybe if I draw this symbol I can speak to him again.")
		if(3)
			var/obj/effect/decal/cleanable/nurgle/T = locate() in src.loc
			if(T)
				M.decay++
				to_chat(M, "Standing upon this rune fills me with warmth, like standing before a roaring fireplace. His voice returns at once, its clear he is pleased. He greets me like a returning child. I am eager to please.")
			else
				to_chat(M, "I must draw his symbol and stand upon it!")
				return
		if(4)
			M.decay++
			to_chat(M, "There will be no stories this time. He has a request for me. I want to please him, I want him to prove to him my worth. To communicate with him I will need to be near his symbol.")
		if(5)
			var/obj/effect/decal/cleanable/nurgle/T = locate() in range(1, get_turf(src))
			var/mob/living/simple_animal/hostile/retaliate/rat/Q = locate() in T.loc
			if(T && Q)
				M.decay++
				M.happiness += 5
				M.nogross = 1
				STAT_LEVEL(end) += 1
				playsound(src, 'sound/effects/fornurgle.ogg', 50, 0, -1)
				to_chat(M, "It is done. I gingerly laid the corpse of his child upon the mark. With a faint flash it is gone. That familiar warmth returns like a hug. ")
				qdel(Q)
			else if(!Q)
				to_chat(M, "He requires something of me. He asked me to bring him one of his children, a rat. He asked me to kill it and place it upon his mark. He has grand designs for me, but they all start with one small step.")
				return



/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Slaanesh//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/slaanesh(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Slaanesh"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>") //notice I removed restraint requirement. A lil bdsm never stopped a slaaneshi boy
		return
	if(rage > 0)
		to_chat(M, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(M, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(M, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(M.lust)
		if(0)
			if(istype(M.l_hand, /obj/item/reagent_containers/pill/happy))
				qdel(usr.l_hand)
				to_chat(M, "You crack open the obscura instead of taking it orally, you snort the contents all at once. Sheer bliss courses through your neurons. Your mind has been opened to unfathomable depths of ecstasy. You feel his call for more. You have taken the first step on the path of the Dark Prince . You are not yet visibly corrupted but avoid detailed investigation. ")
				playsound(src, 'sound/effects/slaanesh1.ogg', 50, 0, -1)
				M.update_inv_l_hand()
				M.lust++
			else if(istype(M.r_hand, /obj/item/reagent_containers/pill/happy))
				qdel(usr.r_hand)
				to_chat(M, "You crack open the obscura instead of taking it orally, you snort the contents all at once. Sheer bliss courses through your neurons. Your mind has been opened to unfathomable depths of ecstasy. You feel his call for more. You have taken the first step on the path of the Dark Prince . You are not yet visibly corrupted but avoid detailed investigation. ")
				playsound(src, 'sound/effects/slaanesh1.ogg', 50, 0, -1)
				M.update_inv_r_hand()
				M.lust++
			else
				to_chat(M, "You love to get high... To experience true bliss and excess. Seek out the scum of this planet, maybe they will have something that could expand your mind. Don't take it orally, make sure to snort it all at once.")
				return
		if(1)
			to_chat(M, "Your body is flooded with the knowledge of excess and pleasure. The Dark Prince's voice is faint but you can make out some commands. Every fiber in your body is flooded with pleasure that fades as fast as it arrives. You want more, you need more.")
			STAT_LEVEL(dex)+=1
			M.lust++
			M.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/tzeentch)
		if(2)
			M.verbs += /mob/living/carbon/human/proc/slaaneshrune
			to_chat(M, "His command is clear. I must have that feeling of ecstasy again. I will obey. His symbol fills my mind, I see it when I close my eyes. I must find a place to draw it, I must honor him.")
			M.lust++
		if(3)
			var/obj/effect/decal/cleanable/slaanesh/T = locate() in src.loc
			if(T)
				M.lust++
				to_chat(M, "Yes! YES! He is pleased, the feeling returns for mere moments. Every pleasure is experienced at once to its absolute pinnacle. Yet again it fades with a sinister laugh. He needs more, I must continue to serve.")
			else
				to_chat(M, "I must draw xer symbol and stand upon it!")
				return




/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Tzeentch//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/tzeentch(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "The Path of Tzeentch"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot call upon Nurgle while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(M, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(M, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(M, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return














////////////////////////////////////////
////////////////Altar/rune making//////
//////////////////////////////////////
/mob/living/carbon/human/proc/nurglerune(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "Nurgle Rune"
	set desc = "In the embrace of great Nurgle, I am no longer afraid."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You can't draw a rune while restrained.")	//user is tied up
		return
	if(decay >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/nurgle(get_turf(src))
		M.health -= 2
		M.add_fingerprint(src)
		to_chat(M, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		return


/mob/living/carbon/human/proc/slaaneshrune(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "Slaanesh Rune"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't draw runes when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You can't draw a rune while restrained.")	//user is tied up
		return
	if(lust >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/slaanesh(get_turf(src))
		M.health -= 2
		M.add_fingerprint(src)
		to_chat(M, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		return

/mob/living/carbon/human/proc/khornerune(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "Khorne Rune"
	set desc = "BLOOD FOR THE BLOOD GOD!"
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't draw a rune when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M,"You can't draw a rune while restrained.")	//user is tied up
		return
	if(rage >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/khorne(get_turf(src))
		M.health -= 2
		M.add_fingerprint(src)
		to_chat(M, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		return

/mob/living/carbon/human/proc/tzeentchrune(var/mob/living/carbon/human/M)
	set category = "Ruinous Powers"
	set name = "Tzeentch Rune"
	set desc = "And my body that crouches in the shadow."
	if(!ishuman(M))
		to_chat(M, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(M.stat == DEAD)
		to_chat(M, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M,"You can't draw a rune while restrained.")	//user is tied up
		return
	if(intrigue >= 2)
		(do_after(usr,80,src))
		new /obj/effect/decal/cleanable/tzeentch(get_turf(src))
		M.health -= 2
		M.add_fingerprint(src)
		to_chat(M, "You pick open your hand using your nails, using the blood you draw the symbol of your patron.")
		return