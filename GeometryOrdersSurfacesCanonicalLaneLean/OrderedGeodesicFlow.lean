import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure OrderedGeodesicFlowPackage (G : SurfaceMetricPackage) where
  timeParameter : Type u
  geodesicAt : timeParameter → Type v
  startPoint : Prop
  endPoint : Prop
  geodesicEquation : Prop
  orderPreserving : Prop
  uniquenessOnOverlap : Prop

structure OrderedGeodesicFlowEvidence {G : SurfaceMetricPackage} (F : OrderedGeodesicFlowPackage G) where
  startPointClosed : F.startPoint
  endPointClosed : F.endPoint
  geodesicEquationClosed : F.geodesicEquation
  orderPreservingClosed : F.orderPreserving
  uniquenessOnOverlapClosed : F.uniquenessOnOverlap

def OrderedGeodesicFlowClosed {G : SurfaceMetricPackage} (F : OrderedGeodesicFlowPackage G) : Prop :=
  F.startPoint ∧ F.endPoint ∧ F.geodesicEquation ∧ F.orderPreserving ∧ F.uniquenessOnOverlap

theorem ordered_geodesic_flow_closed_from_evidence
    {G : SurfaceMetricPackage} (F : OrderedGeodesicFlowPackage G)
    (E : OrderedGeodesicFlowEvidence F) : OrderedGeodesicFlowClosed F := by
  exact And.intro E.startPointClosed
    (And.intro E.endPointClosed
      (And.intro E.geodesicEquationClosed
        (And.intro E.orderPreservingClosed E.uniquenessOnOverlapClosed)))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse