import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure RauchComparisonPackage {G : SurfaceMetricPackage} (F : OrderedGeodesicFlowPackage G) (C : CutLocusPackage F) where
  initialCurvatureBound : Prop
  jacobiFieldEstimate : Prop
  distanceComparison : Prop
  angleComparison : Prop
  volumeComparison : Prop
  comparisonClosed : Prop

structure RauchComparisonEvidence {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} (R : RauchComparisonPackage C) where
  initialCurvatureBoundClosed : R.initialCurvatureBound
  jacobiFieldEstimateClosed : R.jacobiFieldEstimate
  distanceComparisonClosed : R.distanceComparison
  angleComparisonClosed : R.angleComparison
  volumeComparisonClosed : R.volumeComparison
  comparisonClosedClosed : R.comparisonClosed

def RauchComparisonClosed {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F} (R : RauchComparisonPackage C) : Prop :=
  R.initialCurvatureBound ∧ R.jacobiFieldEstimate ∧ R.distanceComparison ∧ R.angleComparison ∧ R.volumeComparison ∧ R.comparisonClosed

theorem rauch_comparison_closed_from_evidence
    {G : SurfaceMetricPackage} {F : OrderedGeodesicFlowPackage G} {C : CutLocusPackage F}
    (R : RauchComparisonPackage C) (E : RauchComparisonEvidence R) : RauchComparisonClosed R := by
  exact And.intro E.initialCurvatureBoundClosed
    (And.intro E.jacobiFieldEstimateClosed
      (And.intro E.distanceComparisonClosed
        (And.intro E.angleComparisonClosed
          (And.intro E.volumeComparisonClosed E.comparisonClosedClosed))))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse