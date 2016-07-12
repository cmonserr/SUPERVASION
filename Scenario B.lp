%%%%%%%%%%%%%%%%%%%%%%
% AUTHOR: Carlos Monserrat
% DATE: 27/05/2016
% SUMMARY: Version without distances and
% more general properties. The time is measured
% with ticks that increase only with events.
% We are trying to learn one rule each time.

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
#domain object(O).

time(1..50).
instrument(i1;i2).
target(g1;g2;none).
object(o1).

event(in_scene(I); out_scene(I); stop(I); move(I); in_cross10(I,G); in_cross5(I,G); in_restarea(I); out_restarea(I); open_instrument(I); close_instrument(I); picked_object(I,O); dropped_object(I,O); on_towards(I,G); off_towards(I,G);out_cross10(I,G); out_cross5(I,G)).
fluent(present(I); waiting(I); towards(I,G); in10(I,G); in5(I,G);  rest(I); open(I); carry(I,O)).
fluentF(go_target(I,G); clip_object(I,O); leave_object(I,O); go_rest(I)).


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
%initially(present(i1)).
happensAt(in_scene(i1),1).
happensAt(move(i1),2).
happensAt(on_towards(i1,g1),2).
happensAt(on_towards(i1,g2),2).
happensAt(off_towards(i1,g2),3).
happensAt(stop(i1),4).
happensAt(move(i1),5).
happensAt(on_towards(i1,g1),5).
happensAt(in_cross10(i1,g1),6).
happensAt(in_cross5(i1,g1),7).
happensAt(stop(i1),8).
happensAt(open_instrument(i1),9).
happensAt(close_instrument(i1),10).
happensAt(picked_object(i1,o1), 10).
happensAt(move(i1), 11).
happensAt(on_towards(i1,g2),11).
happensAt(out_cross5(i1,g1),12).
happensAt(out_cross10(i1,g1),13).
happensAt(in_cross10(i1,g2),14).
happensAt(in_cross5(i1,g2),15).
happensAt(stop(i1),16).
happensAt(open_instrument(i1),17).
happensAt(dropped_object(i1,o1),17).
happensAt(close_instrument(i1),18).
happensAt(move(i1),19).
happensAt(on_towards(i1,none),19).
happensAt(out_cross5(i1,g2),20).
happensAt(out_cross10(i1,g2),21).
happensAt(in_restarea(i1), 22).
happensAt(stop(i1),23).

happensAt(in_scene(i2),23).
happensAt(move(i2),24).
happensAt(on_towards(i2,g2),24).
happensAt(stop(i2),25).
happensAt(move(i2),26).
happensAt(on_towards(i2,g2),26).
happensAt(in_cross10(i2,g2),27).
happensAt(in_cross5(i2,g2),28).
happensAt(stop(i2),29).
happensAt(open_instrument(i2),30).
happensAt(close_instrument(i2),31).
happensAt(picked_object(i2,o1), 31).
happensAt(move(i2), 32).
happensAt(on_towards(i2,g1),32).
happensAt(out_cross5(i2,g2),33).
happensAt(out_cross10(i2,g2),34).
happensAt(in_cross10(i2,g1),35).
happensAt(in_cross5(i2,g1),36).
happensAt(stop(i2),37).
happensAt(open_instrument(i2),38).
happensAt(dropped_object(i2,o1),38).
happensAt(close_instrument(i2),39).
happensAt(move(i2),40).
happensAt(on_towards(i2,none),40).
happensAt(out_cross5(i2,g1),41).
happensAt(out_cross10(i2,g1),42).
happensAt(in_restarea(i2), 43).
happensAt(stop(i2),44).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLES                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Trying to learn the clip_object rule.
#example not holdsAtF(clip_object(i1,o1),1).
#example not holdsAtF(clip_object(i1,o1),2).
#example not holdsAtF(clip_object(i1,o1),3).
#example not holdsAtF(clip_object(i1,o1),4).
#example not holdsAtF(clip_object(i1,o1),5).
#example not holdsAtF(clip_object(i1,o1),6).
#example not holdsAtF(clip_object(i1,o1),7).
#example not holdsAtF(clip_object(i1,o1),8).
#example not holdsAtF(clip_object(i1,o1),9).
#example not holdsAtF(clip_object(i1,o1),10).
#example holdsAtF(clip_object(i1,o1),11).
#example holdsAtF(clip_object(i1,o1),12).
#example holdsAtF(clip_object(i1,o1),13).
#example holdsAtF(clip_object(i1,o1),14).
#example holdsAtF(clip_object(i1,o1),15).
#example holdsAtF(clip_object(i1,o1),16).
#example holdsAtF(clip_object(i1,o1),17).
#example not holdsAtF(clip_object(i1,o1),18).
#example not holdsAtF(clip_object(i1,o1),19).
#example not holdsAtF(clip_object(i1,o1),20).
#example not holdsAtF(clip_object(i1,o1),21).
#example not holdsAtF(clip_object(i1,o1),22).
#example not holdsAtF(clip_object(i2,o1),23).
#example not holdsAtF(clip_object(i2,o1),23).
#example not holdsAtF(clip_object(i2,o1),24).
#example not holdsAtF(clip_object(i2,o1),25).
#example not holdsAtF(clip_object(i2,o1),26).
#example not holdsAtF(clip_object(i2,o1),27).
#example not holdsAtF(clip_object(i2,o1),28).
#example not holdsAtF(clip_object(i2,o1),29).
#example not holdsAtF(clip_object(i2,o1),30).
#example not holdsAtF(clip_object(i2,o1),31).
#example holdsAtF(clip_object(i2,o1),32).
#example holdsAtF(clip_object(i2,o1),33).
#example holdsAtF(clip_object(i2,o1),34).
#example holdsAtF(clip_object(i2,o1),35).
#example holdsAtF(clip_object(i2,o1),36).
#example holdsAtF(clip_object(i2,o1),37).
#example holdsAtF(clip_object(i2,o1),38).
#example not holdsAtF(clip_object(i2,o1),39).
#example not holdsAtF(clip_object(i2,o1),40).
#example not holdsAtF(clip_object(i2,o1),41).
#example not holdsAtF(clip_object(i2,o1),42).
#example not holdsAtF(clip_object(i2,o1),43).
#example not holdsAtF(clip_object(i2,o1),44).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODE DECLARATIONS          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#modeh initiatesF($fluentF,+time).
#modeh terminatesF($fluentF,+time).
#modeb holdsAt(in5($instrument,$target),+time)=5.
#modeb holdsAt(in10($instrument,$target),+time).
#modeb holdsAt(rest($instrument),+time).
#modeb holdsAt(towards($instrument,$target),+time).
#modeb holdsAt(waiting($instrument),+time).
#modeb holdsAt(open($instrument),+time).
#modeb holdsAt(carry($instrument,+object),+time)=5.
#modeb not holdsAt(carry($instrument,+object),+time)=5.
%%#modeb holdsAt($fluent,+time).
%%#modeb not holdsAt($fluent,+time).
%%#modeb happensAt($event,+time).


%*#modeh initiatesF($fluentF,+time).
#modeh terminatesF($fluentF,+time).
#modeb holdsAt($fluent,+time).
#modeb not holdsAt($fluent,+time).*%

%Generalisaton of go_rest
%*#modeh initiatesF(go_rest(+instrument),+time).
#modeh terminatesF(go_rest(+instrument),+time).
#modeb holdsAt(carry(+instrument,$object),+time).
#modeb holdsAt(open(+instrument),+time).
#modeb holdsAt(in5(+instrument,$target),+time).
#modeb holdsAt(in10(+instrument,$target),+time).
#modeb not holdsAt(carry(+instrument,$object),+time).
#modeb not holdsAt(open(+instrument),+time).
#modeb not holdsAt(in5(+instrument,$target),+time).
#modeb not holdsAt(in10(+instrument,$target),+time).*%

