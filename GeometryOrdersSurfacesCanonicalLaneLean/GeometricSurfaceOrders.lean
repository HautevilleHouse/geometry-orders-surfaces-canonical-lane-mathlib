import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure GeometricSurfaceOrderPackage where
  surface : Type u
  topology : TopologicalSpace surface
  orderRelation : surface → surface → Prop
  riemannianMetric : Type v
  curvatureTensor : Type w
  smoothStructure : Prop
  orderCompatibleWithMetric : Prop
  curvatureBounded : Prop

structure GeometricSurfaceOrderEvidence (P : GeometricSurfaceOrderPackage) where
  smoothStructureClosed : P.smoothStructure
  orderCompatibleWithMetricClosed : P.orderCompatibleWithMetric
  curvatureBoundedClosed : P.curvatureBounded

def GeometricSurfaceOrderClosed (P : GeometricSurfaceOrderPackage) : Prop :=
  P.smoothStructure ∧ P.orderCompatibleWithMetric ∧ P.curvatureBounded

theorem geometric_surface_order_closed_from_evidence (P : GeometricSurfaceOrderPackage)
    (E : GeometricSurfaceOrderEvidence P) : GeometricSurfaceOrderClosed P := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.orderCompatibleWithMetricClosed E.curvatureBoundedClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse