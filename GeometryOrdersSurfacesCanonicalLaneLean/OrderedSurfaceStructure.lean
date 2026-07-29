import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure OrderedSurfaceStructurePackage where
  surface : Type u
  topology : TopologicalSpace surface
  orderRelation : surface → surface → Prop
  metric : Type v
  causalStructure : Type w
  orderCompatibleWithMetric : Prop
  causalConvexity : Prop
  globalHyperbolicity : Prop
  stableCausality : Prop

structure OrderedSurfaceStructureEvidence (O : OrderedSurfaceStructurePackage) where
  orderCompatibleWithMetricClosed : O.orderCompatibleWithMetric
  causalConvexityClosed : O.causalConvexity
  globalHyperbolicityClosed : O.globalHyperbolicity
  stableCausalityClosed : O.stableCausality

def OrderedSurfaceStructureClosed (O : OrderedSurfaceStructurePackage) : Prop :=
  O.orderCompatibleWithMetric ∧ O.causalConvexity ∧ O.globalHyperbolicity ∧ O.stableCausality

theorem ordered_surface_structure_closed_from_evidence (O : OrderedSurfaceStructurePackage) (E : OrderedSurfaceStructureEvidence O) :
    OrderedSurfaceStructureClosed O := by
  exact And.intro E.orderCompatibleWithMetricClosed
    (And.intro E.causalConvexityClosed
      (And.intro E.globalHyperbolicityClosed E.stableCausalityClosed))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse