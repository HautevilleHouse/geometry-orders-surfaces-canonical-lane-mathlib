import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure GeodesicFramingPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  connection : Type w
  parallelTransport : Type x
  geodesicSpray : Type y
  geodesicCompleteness : Prop
  exponentialMapDefined : Prop
  gaussLemma : Prop
  geodesicConvexity : Prop

structure GeodesicFramingEvidence (G : GeodesicFramingPackage) where
  geodesicCompletenessClosed : G.geodesicCompleteness
  exponentialMapDefinedClosed : G.exponentialMapDefined
  gaussLemmaClosed : G.gaussLemma
  geodesicConvexityClosed : G.geodesicConvexity

def GeodesicFramingClosed (G : GeodesicFramingPackage) : Prop :=
  G.geodesicCompleteness ∧ G.exponentialMapDefined ∧ G.gaussLemma ∧ G.geodesicConvexity

theorem geodesic_framing_closed_from_evidence (G : GeodesicFramingPackage) (E : GeodesicFramingEvidence G) :
    GeodesicFramingClosed G := by
  exact And.intro E.geodesicCompletenessClosed
    (And.intro E.exponentialMapDefinedClosed
      (And.intro E.gaussLemmaClosed E.geodesicConvexityClosed))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse