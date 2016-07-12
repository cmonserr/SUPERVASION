# SUPERVASION
## Knowledge Acquisition by Abduction for Skills Monitoring: Application to Surgical Skills

In this GitHub entry, we present some features related to the work sent to the ILP congress (26th International Conference on Inductive Logic Programming) that holds in London in September of 2016. This entry shows some of the experiments not included in the paper because of the lack of space. Besides, we have included the Narrative used in the experiments as well as the code in XHAIL used for the experiments.

The files that can be found in this entry are (for more information see the Wiki):

1.- Scenario A.lp: that contains the XHAIL code of the Scenario A.

2.- Scenario B.lp: that contains the XHAIL code of the Scenario B.

2.- Scenario_A_events.pdf: a graph that shows the low-level events contained in the narrative of the Scenario A.

3.- Scenario_A_fluent_graph.pdf: a graph that shows the low-level fluents (black) and high-level fluents (blue) contained in the narrative and the examples provided in Scenario A.

4.- Scenario_A_fluent_graph_detect.pdf: a graph that shows the vertical bands that are the temporal windows for the initiatesF/2 (the leftmost point of the high-level fluents clip_object/2) and for the terminatesF/2 (the rightmost point of the high-level fluents clip_object/2) obtained from the rules learned from the Scenario B.

5.- Scenario_B_events.pdf: a graph that shows the low-level events contained in the narrative of the Scenario B.

6.- Scenario_B_fluents.pdf: a graph that shows the low-level fluents (black) and high-level fluents (blue) contained in the narrative and the examples provided in Scenario B.

7- Scenario_B_fluents_detect.pdf: a graph that show the vertical bands that are the temporal windows for the initiatesF/2 (the leftmost point of the high-level fluents clip_object/2) and for the terminatesF/2 (the rightmost point of the high-level fluents clip_object/2) obtained from the rules learned from the Scenario A. Here, the initiatesF/2 of the second high-level fluent is not detected (see the wiki for details).

8.- Scenario_B_fluents_detect_mod.pdf: the same graph as Scenario_B_fluents_detect.pdf shows but removing the presence of the tool i1 from bin g2 in the rules learned from Scenario A. This rule modification has been suggested by experts and demonstrates the easy supervision of the learning and easy modification of the rules learned. Modification done by experts without deep knowledge in computer programming. With this modification, the initiatesF/2 of the second high-level fluent is detected (see the Wiki for details).
