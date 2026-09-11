using RimWorld;
using Verse;

namespace DoctorStupid.ShinyMod
{
    // Three vanilla traits change what this mod does to a pawn, and nothing in their own
    // descriptions says so. One sentence is appended to each at startup.
    //
    // Why a static constructor rather than an XML patch: DefInjected translations are applied
    // after patches, so a patched description is overwritten wholesale by the language pack and
    // the sentence disappears in every language but English. Static constructors run after
    // translation injection, so this appends to whatever the loaded language produced - and the
    // sentence itself comes from a keyed string, so it is in that same language.
    [StaticConstructorOnStartup]
    public static class ShinyModTraitDescriptions
    {
        static ShinyModTraitDescriptions()
        {
            Append(TraitDefOf.Greedy, "ShinyMod.Trait.Greedy");
            Append(TraitDefOf.Jealous, "ShinyMod.Trait.Jealous");
            Append(TraitDefOf.Ascetic, "ShinyMod.Trait.Ascetic");
        }

        private static void Append(TraitDef trait, string key)
        {
            if (trait?.degreeDatas == null)
            {
                return;
            }

            string sentence = key.Translate();
            for (int i = 0; i < trait.degreeDatas.Count; i++)
            {
                // Every degree of these three, not one picked by label. The original compared the
                // degree label against the English word - "greedy", "jealous", "ascetic" - and a
                // degree label is translated, so in French it reads "cupide" and the comparison
                // never matched. All three traits have exactly one degree anyway.
                TraitDegreeData degree = trait.degreeDatas[i];
                if (degree.description.NullOrEmpty() || degree.description.Contains(sentence))
                {
                    continue;
                }
                degree.description = degree.description + " " + sentence;
            }
        }
    }
}
