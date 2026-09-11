using System.Collections.Generic;
using RimWorld;
using Verse;

namespace DoctorStupid.ShinyMod
{
    // Scores the material a pawn's gear is MADE OF, not the gear itself. A stuff in the Metallic
    // or Stony category whose Beauty stat factor reaches minShiny is worth one point, and one that
    // reaches minGlamorous is worth three; the primary weapon and every worn apparel are counted.
    // In vanilla 1.6 that is silver, obsidian and jade at one point each, and gold at three.
    public class ThoughtWorker_ShinyEquipment : ThoughtWorker
    {
        public const float minShiny = 2.0f;
        public const float minGlamorous = 4.0f;

        public static ThoughtState CurrentThoughtState(Pawn p)
        {
            string best = null;
            bool glistening = false;
            int count = 0;
            int points = 0;

            // Both trackers are null on a pawn that cannot carry gear. The thought is gated on
            // traits, so in practice it only ever sees humanlikes, but a null here would throw
            // once per pawn per situational-thought recalculation rather than fail visibly.
            Score(p.equipment?.Primary, ref best, ref glistening, ref count, ref points);

            List<Apparel> worn = p.apparel?.WornApparel;
            if (worn != null)
            {
                for (int i = 0; i < worn.Count; i++)
                {
                    Score(worn[i], ref best, ref glistening, ref count, ref points);
                }
            }

            if (count == 0)
            {
                return ThoughtState.Inactive;
            }

            // The reason is what the mood tab shows in place of the stage label's {0}. It is built
            // from keyed strings rather than concatenated in English: a label assembled in code is
            // the one piece of a mod no translator can reach.
            string reason = (glistening ? "ShinyMod.Reason.Glistening" : "ShinyMod.Reason.Shiny")
                .Translate(best.Named("ITEM"));
            if (count >= 2)
            {
                reason = "ShinyMod.Reason.AndMore".Translate(reason.Named("REASON"));
            }

            // No clamp needed: ThoughtState.StageIndexFor already caps the index at the last stage
            // the def declares, and the defs declare the six this can produce.
            return ThoughtState.ActiveAtStage(points - 1, reason);
        }

        private static void Score(Thing thing, ref string best, ref bool glistening, ref int count, ref int points)
        {
            ThingDef stuff = thing?.Stuff;
            if (stuff?.stuffProps?.categories == null || stuff.stuffProps.statFactors == null)
            {
                return;
            }
            if (!stuff.stuffProps.categories.Contains(StuffCategoryDefOf.Metallic)
                && !stuff.stuffProps.categories.Contains(StuffCategoryDefOf.Stony))
            {
                return;
            }

            List<StatModifier> factors = stuff.stuffProps.statFactors;
            for (int i = 0; i < factors.Count; i++)
            {
                if (factors[i].stat != StatDefOf.Beauty)
                {
                    continue;
                }
                if (factors[i].value >= minGlamorous)
                {
                    // The first glistening item wins the label outright, even if a shiny one was
                    // found before it.
                    if (!glistening)
                    {
                        best = thing.LabelNoParenthesis;
                        glistening = true;
                    }
                    count++;
                    points += 3;
                }
                else if (factors[i].value >= minShiny)
                {
                    if (count == 0)
                    {
                        best = thing.LabelNoParenthesis;
                    }
                    count++;
                    points += 1;
                }
            }
        }

        protected override ThoughtState CurrentStateInternal(Pawn p)
        {
            return CurrentThoughtState(p);
        }
    }
}
