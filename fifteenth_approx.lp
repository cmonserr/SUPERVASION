% use the learned rule to detect when clips the
% left hand.

#display initiatesF/2.
#display terminatesF/2.

%%%%%%%%%%%%%%%%%%%%%%%%
% TYPE DEFINITIONS    %%
%%%%%%%%%%%%%%%%%%%%%%%%

#domain fluent(F).
#domain fluentF(FF).
#domain event(E).
#domain time(T;T1;T2).
#domain instrument(I).
#domain target(G).
#domain targetf(G1).
#domain object(O).

time(0..75).
instrument(i1;i2).
target(g1;g2;none).
targetf(g1;g2;none).
object(o1).

event(in_scene(I); out_scene(I); stop(I); move(I); in_cross10(I,G); in_cross5(I,G); in_restarea(I); out_restarea(I); open_instrument(I); close_instrument(I); picked_object(I,O); dropped_object(I,O); on_towards(I,G); off_towards(I,G);out_cross10(I,G); out_cross5(I,G)).
fluent(present(I); towards(I,G); in10(I,G); in5(I,G);  rest(I); open(I); carry(I,O)).

%% I have removed the waiting fluent: waiting(I); .

fluentF(go_target(I,G); clip_object(I,O,G,G1); leave_object(I,O); go_rest(I)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EVENT CALCULUS DEFINITIONS %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

holdsAt(F,T) :- initially(F), not stoppedIn(0,F,T).
holdsAt(F,T) :- happensAt(E,T1), initiates(E,F,T1), not stoppedIn(T1,F,T), T1<T.
stoppedIn(T1,F,T2) :- happensAt(E,T), T1<T, T<T2, terminates(E,F,T).
%initiatesF(F,T) :- initiates(E,F,T), happensAt(E,T).
%terminatesF(F,T) :- terminates(E,F,T), happensAt(E,T).

holdsAtF(FF,T+1) :- not holdsAtF(FF,T),initiatesF(FF,T).
holdsAtF(FF,T+1) :- holdsAtF(FF,T), not terminatesF(FF,T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOMAIN DEPENDENT AXIOMS    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
initiates(in_scene(I), present(I), T).
terminates(out_scene(I), present(I), T).
initiates(stop(I), waiting(I), T).
terminates(move(I), waiting(I), T).
initiates(in_cross10(I,G), in10(I,G), T).
terminates(out_cross10(I,G), in10(I,G), T).
initiates(in_cross5(I,G), in5(I,G), T).
terminates(out_cross5(I,G), in5(I,G), T).
initiates(in_restarea(I), rest(I), T).
terminates(out_restarea(I), rest(I),T).
initiates(open_instrument(I), open(I), T).
terminates(close_instrument(I), open(I), T).
initiates(picked_object(I,O), carry(I,O), T).
terminates(dropped_object(I,O), carry(I,O),T).
initiates(on_towards(I,G), towards(I,G), T) :- not holdsAt(waiting(I),T).
terminates(off_towards(I,G), towards(I,G), T).
terminates(stop(I), towards(I,G), T) :- target(G).

terminates(in_cross5(I,G),in10(I,G),T).
initiates(out_cross5(I,G),in10(I,G),T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESCENARIO & NARRATIVE      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Here you have to writte the initial situation
%and initial state before initating the process.
%Narrative
%
happensAt(in_scene(i1),0).
happensAt(open_instrument(i1),1).
happensAt(move(i1),2).
happensAt(on_towards(i1,g1),2).
happensAt(in_cross10(i1,g1),3).
happensAt(in_cross5(i1,g1),4).
happensAt(stop(i1),5).
happensAt(close_instrument(i1),6).
happensAt(picked_object(i1,o1),6).
happensAt(move(i1),7).
happensAt(on_towards(i1,none),7).
happensAt(out_cross5(i1,g1),8).
happensAt(out_cross10(i1,g1),9).
happensAt(off_towards(i1,none),10).
happensAt(on_towards(i1,g2),10).
happensAt(in_scene(i2),11).
happensAt(open_instrument(i2),12).
happensAt(in_cross10(i1,g2),12).
happensAt(move(i2),13).
happensAt(on_towards(i2,g2),13).
happensAt(in_cross5(i1,g2),13).
happensAt(stop(i1),14).
happensAt(open_instrument(i1),15).
happensAt(dropped_object(i1,o1),15).
happensAt(stop(i2),15).
happensAt(move(i1),16).
happensAt(on_towards(i1,none),16).
happensAt(move(i2),16).
happensAt(on_towards(i2,g2),16).
happensAt(out_cross5(i1,g2),17).
happensAt(out_cross10(i1,g2),18).
happensAt(stop(i1),19).
happensAt(in_cross10(i2,g2),19).
happensAt(in_cross5(i2,g2),20).
happensAt(stop(i2),21).
happensAt(move(i1),22).
happensAt(on_towards(i1,none),22).
happensAt(in_cross10(i1,g2),23).
happensAt(in_cross5(i1,g2),24).
happensAt(close_instrument(i1),25).
happensAt(picked_object(i1,o1),25).
happensAt(move(i2),26).
happensAt(on_towards(i2,none),26).
happensAt(out_cross5(i2,g2),27).
happensAt(open_instrument(i1),27).
happensAt(dropped_object(i1,o1),27).
happensAt(out_cross5(i1,g2),28).
happensAt(out_cross10(i1,g2),29).
happensAt(in_cross5(i2,g2),29).
happensAt(in_cross10(i1,g2),30).
happensAt(in_cross5(i1,g2),31).
happensAt(stop(i1),31).
happensAt(stop(i2),32).
happensAt(close_instrument(i2),33).
happensAt(picked_object(i2,o1),33).
happensAt(move(i2),34).
happensAt(on_towards(i2,none),34).
happensAt(out_cross5(i2,g2),35).
happensAt(out_cross10(i2,g2),36).
happensAt(off_towards(i2,none),37).
happensAt(on_towards(i2,g1),37).
happensAt(in_cross10(i2,g1),38).
happensAt(stop(i2),39).
happensAt(move(i2),39).
happensAt(on_towards(i2,none),39).
happensAt(in_cross5(i2,g1),39).
happensAt(stop(i2),40).
happensAt(open_instrument(i2),41).
happensAt(dropped_object(i2,o1),41).
happensAt(out_cross5(i2,g1),42).
happensAt(out_cross10(i2,g1),43).
happensAt(in_cross10(i2,g1),44).
happensAt(in_cross5(i2,g1),45).
happensAt(stop(i2),46).
happensAt(close_instrument(i2),47).
happensAt(picked_object(i2,o1),47).
happensAt(move(i2),48).
happensAt(on_towards(i2,none),48).
happensAt(out_cross5(i2,g1),49).
happensAt(out_cross10(i2,g1),50).
happensAt(off_towards(i2,none),51).
happensAt(on_towards(i2,g2),51).
happensAt(move(i1),51).
happensAt(on_towards(i1,none),51).
happensAt(out_cross5(i1,g2),52).
happensAt(out_cross10(i1,g2),53).
happensAt(in_cross10(i2,g2),53).
happensAt(stop(i1),53).
happensAt(in_cross5(i2,g2),54).
happensAt(stop(i2),55).
happensAt(open_instrument(i2),56).
happensAt(dropped_object(i2,o1),56).
happensAt(move(i2),57).
happensAt(on_towards(i2,none),57).
happensAt(out_cross5(i2,g2),58).
happensAt(out_cross10(i2,g2),59).
happensAt(move(i1),59).
happensAt(on_towards(i1,g2),59).
happensAt(stop(i2),60).
happensAt(in_cross10(i1,g2),60).
happensAt(in_cross5(i1,g2),61).
happensAt(stop(i1),62).
happensAt(close_instrument(i1),63).
happensAt(picked_object(i1,o1),63).
happensAt(move(i1),64).
happensAt(on_towards(i2,none),64).
happensAt(out_cross5(i1,g2),65).
happensAt(out_cross10(i1,g2),66).
happensAt(off_towards(i1,none),67).
happensAt(on_towards(i1,g1),67).
happensAt(move(i2),67).
happensAt(on_towards(i2,g1),67).
happensAt(out_scene(i2),68).
happensAt(stop(i2),69).
happensAt(in_cross10(i1,g1),69).
happensAt(in_cross5(i1,g1),70).
happensAt(stop(i1),71).
happensAt(open_instrument(i1),72).
happensAt(dropped_object(i1,o1),72).
happensAt(move(i1),73).
happensAt(on_towards(i1,none),73).
happensAt(out_cross5(i1,g1),74).
happensAt(out_cross10(i1,g1),75).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLES                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%CLIPPING AN OBJECT

#example not holdsAtF(clip_object(i1,o1,g1,g2),3)=4.
#example not holdsAtF(clip_object(i1,o1,g1,g2),4)=3.
#example not holdsAtF(clip_object(i1,o1,g1,g2),5)=2.
#example not holdsAtF(clip_object(i1,o1,g1,g2),6)=1.
#example holdsAtF(clip_object(i1,o1,g1,g2),7)=1.
#example holdsAtF(clip_object(i1,o1,g1,g2),8)=3.
#example holdsAtF(clip_object(i1,o1,g1,g2),9)=5.
#example holdsAtF(clip_object(i1,o1,g1,g2),10)=5.
#example holdsAtF(clip_object(i1,o1,g1,g2),11)=5.
#example holdsAtF(clip_object(i1,o1,g1,g2),12)=5.
#example holdsAtF(clip_object(i1,o1,g1,g2),13)=5.
#example holdsAtF(clip_object(i1,o1,g1,g2),14)=3.
#example holdsAtF(clip_object(i1,o1,g1,g2),15)=1.
#example not holdsAtF(clip_object(i1,o1,g1,g2),16)=1.
#example not holdsAtF(clip_object(i1,o1,g1,g2),17)=2.
#example not holdsAtF(clip_object(i1,o1,g1,g2),18)=3.
#example not holdsAtF(clip_object(i1,o1,g1,g2),19)=4.


#example not holdsAtF(clip_object(i1,o1,g2,g1),60)=4.
#example not holdsAtF(clip_object(i1,o1,g2,g1),61)=3.
#example not holdsAtF(clip_object(i1,o1,g2,g1),62)=2.
#example not holdsAtF(clip_object(i1,o1,g2,g1),63)=1.
#example holdsAtF(clip_object(i1,o1,g2,g1),64)=1.
#example holdsAtF(clip_object(i1,o1,g2,g1),65)=3.
#example holdsAtF(clip_object(i1,o1,g2,g1),66)=5.
#example holdsAtF(clip_object(i1,o1,g2,g1),67)=5.
#example holdsAtF(clip_object(i1,o1,g2,g1),68)=5.
#example holdsAtF(clip_object(i1,o1,g2,g1),69)=5.
#example holdsAtF(clip_object(i1,o1,g2,g1),70)=5.
#example holdsAtF(clip_object(i1,o1,g2,g1),71)=3.
#example holdsAtF(clip_object(i1,o1,g2,g1),72)=1.
#example not holdsAtF(clip_object(i1,o1,g2,g1),73)=1.
#example not holdsAtF(clip_object(i1,o1,g2,g1),74)=2.
#example not holdsAtF(clip_object(i1,o1,g2,g1),75)=3.


#example not holdsAtF(clip_object(i2,o1,g2,g1),30)=4.
#example not holdsAtF(clip_object(i2,o1,g2,g1),31)=3.
#example not holdsAtF(clip_object(i2,o1,g2,g1),32)=2.
#example not holdsAtF(clip_object(i2,o1,g2,g1),33)=1.
#example holdsAtF(clip_object(i2,o1,g2,g1),34)=1.
#example holdsAtF(clip_object(i2,o1,g2,g1),35)=3.
#example holdsAtF(clip_object(i2,o1,g2,g1),36)=5.
#example holdsAtF(clip_object(i2,o1,g2,g1),37)=5.
#example holdsAtF(clip_object(i2,o1,g2,g1),38)=5.
#example holdsAtF(clip_object(i2,o1,g2,g1),39)=5.
#example holdsAtF(clip_object(i2,o1,g2,g1),40)=3.
#example holdsAtF(clip_object(i2,o1,g2,g1),41)=1.
#example not holdsAtF(clip_object(i2,o1,g2,g1),42)=1.
#example not holdsAtF(clip_object(i2,o1,g2,g1),43)=2.
#example not holdsAtF(clip_object(i2,o1,g2,g1),44)=3.
#example not holdsAtF(clip_object(i2,o1,g2,g1),45)=4.


#example not holdsAtF(clip_object(i2,o1,g1,g2),44)=4.
#example not holdsAtF(clip_object(i2,o1,g1,g2),45)=3.
#example not holdsAtF(clip_object(i2,o1,g1,g2),46)=2.
#example not holdsAtF(clip_object(i2,o1,g1,g2),47)=1.
#example holdsAtF(clip_object(i2,o1,g1,g2),48)=1.
#example holdsAtF(clip_object(i2,o1,g1,g2),49)=3.
#example holdsAtF(clip_object(i2,o1,g1,g2),50)=5.
#example holdsAtF(clip_object(i2,o1,g1,g2),51)=5.
#example holdsAtF(clip_object(i2,o1,g1,g2),52)=5.
#example holdsAtF(clip_object(i2,o1,g1,g2),53)=5.
#example holdsAtF(clip_object(i2,o1,g1,g2),54)=5.
#example holdsAtF(clip_object(i2,o1,g1,g2),55)=3.
#example holdsAtF(clip_object(i2,o1,g1,g2),56)=1.
#example not holdsAtF(clip_object(i2,o1,g1,g2),57)=1.
#example not holdsAtF(clip_object(i2,o1,g1,g2),58)=2.
#example not holdsAtF(clip_object(i2,o1,g1,g2),59)=3.
#example not holdsAtF(clip_object(i2,o1,g1,g2),60)=4.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODE DECLARATIONS          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#modeh initiatesF(clip_object(+instrument,+object,+target,+targetf),+time).
#modeh terminatesF(clip_object(+instrument,+object,+target,+targetf),+time).
#modeb holdsAt(in5(+instrument,+target),+time).
#modeb not holdsAt(in5(+instrument,+target),+time).
#modeb holdsAt(in5(+instrument,+targetf),+time).
#modeb not holdsAt(in5(+instrument,+targetf),+time).
#modeb holdsAt(carry(+instrument,+object),+time).
#modeb not holdsAt(carry(+instrument,+object),+time).
#modeb holdsAt(open(+instrument)).
#modeb not holdsAt(open(+instrument)).

%*
#modeh initiatesF(clip_object(i1,o1,g1,g2),+time).
#modeh terminatesF(clip_object(i1,o1,g1,g2),+time).
#modeh initiatesF(clip_object(i1,o1,g2,g1),+time).
#modeh terminatesF(clip_object(i1,o1,g2,g1),+time).

#modeb not holdsAt($fluent,+time).
#modeb holdsAt($fluent,+time).
*%
