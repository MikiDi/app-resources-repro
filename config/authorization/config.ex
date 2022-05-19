alias Acl.GraphSpec.Constraint.Resource, as: ResourceConstraint
alias Acl.GraphSpec.Constraint.ResourceFormat, as: ResourceFormatConstraint
alias Acl.Accessibility.ByQuery, as: AccessByQuery
alias Acl.GraphSpec, as: GraphSpec
alias Acl.GroupSpec, as: GroupSpec
alias Acl.GroupSpec.GraphCleanup, as: GraphCleanup
alias Acl.Accessibility.Always, as: AlwaysAccessible

defmodule Acl.UserGroups.Config do

  def user_groups do
    [

      # // BASE
      %GroupSpec{
        name: "base",
        useage: [:read, :write, :read_for_write],
        access: %AlwaysAccessible{},
        graphs: [ %GraphSpec{
                    graph: "http://mu.semte.ch/graphs/public",
                    constraint: %ResourceConstraint{
                      resource_types: [
                        "http://vocab.deri.ie/cogs#Job",
                        # "http://www.semanticdesktop.org/ontologies/2007/03/22/nfo#FileDataObject", # Currently read-only
                      ]
                    } } ] },
      # // CLEANUP
      #
      %GraphCleanup{
        originating_graph: "http://mu.semte.ch/application",
        useage: [:write],
        name: "clean"
      }
    ]
  end
end
