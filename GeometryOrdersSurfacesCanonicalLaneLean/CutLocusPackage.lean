import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure CutLocusPackage {G : SurfaceMetricPackage} (F : OrderedGeodesicFlowPackage G) where
  cutPoint : G.manifold → Prop
  conjugatePoint : G.manifold → Prop
  cutLocusStructure : Prop
  conjugateLocusStructure : Prop
  relationCutConjugate : Prop
  structureClosed : Prop

structure CutLocusEvidence {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} (C : CutLocusPackage F) where
  cutLocusStructureClosed : C.cutLocusStructure
  conjugateLocusStructureClosed : C.conjugateLocusStructure
  relationCutConjugateClosed : C.relationCutConjugate
  structureClosedClosed : C.structureClosed

def CutLocusClosed {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} (C : CutLocusPackage F) : Prop :=
  C.cutLocusStructure ∧ C.conjugateLocusStructure ∧ C.relationCutConjugate ∧ C.structureClosed

theorem cut_locus_closed_from_evidence
    {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G}
    (C : CutLocusPackage F) (E : CutLocusEvidence C) : CutLocusClosed C := by
  exact And.intro E.cutLocusStructureClosed
    (And.intro E.conjugateLocusStructureClosed
      (And.intro E.relationCutConjugateClosed E.structureClosedClosed))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse