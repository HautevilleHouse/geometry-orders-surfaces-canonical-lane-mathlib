import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure RiemannianSurfaceOrderPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  order : surface → surface → Prop
  riemannMetricSmooth : Prop
  orderCompatibleWithMetric : Prop
  orderRelationPartialOrder : Prop

structure RiemannianSurfaceOrderEvidence (G : RiemannianSurfaceOrderPackage) where
  riemannMetricSmoothClosed : G.riemannMetricSmooth
  orderCompatibleWithMetricClosed : G.orderCompatibleWithMetric
  orderRelationPartialOrderClosed : G.orderRelationPartialOrder

def RiemannianSurfaceOrderClosed (G : RiemannianSurfaceOrderPackage) : Prop :=
  G.riemannMetricSmooth ∧ G.orderCompatibleWithMetric ∧ G.orderRelationPartialOrder

theorem riemannian_surface_order_closed_from_evidence (G : RiemannianSurfaceOrderPackage) (E : RiemannianSurfaceOrderEvidence G) : RiemannianSurfaceOrderClosed G := by
  exact And.intro E.riemannMetricSmoothClosed (And.intro E.orderCompatibleWithMetricClosed E.orderRelationPartialOrderClosed)

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse