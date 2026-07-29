import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure RiemannianOrderPackage where
  surface : Type u
  topology : TopologicalSpace surface
  riemannianMetric : Type v
  orderStructure : Type w
  compatibility : Prop
  closedGeodesicOrder : Prop

structure RiemannianOrderEvidence (R : RiemannianOrderPackage) where
  compatibilityClosed : R.compatibility
  closedGeodesicOrderClosed : R.closedGeodesicOrder

def RiemannianOrderClosed (R : RiemannianOrderPackage) : Prop :=
  R.compatibility ∧ R.closedGeodesicOrder

theorem riemannian_order_closed_from_evidence (R : RiemannianOrderPackage)
    (E : RiemannianOrderEvidence R) : RiemannianOrderClosed R := by
  exact And.intro E.compatibilityClosed E.closedGeodesicOrderClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse