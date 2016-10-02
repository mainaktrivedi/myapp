$(function() {
        console.log( "ready!" );


    var tree = [
      {
        text: "Parent 1",
        nodes: [
          {
            text: "Child 1",
            nodes: [
              {
                text: "Grandchild1"
              },
              {
                text: "Grandchild2"
              }
            ]
          },
          {
            text: "Child 2"
          }
        ]
      },
      {
        text: "Parent 2"
      },
      {
        text: "Parent 3"
      },
      {
        text: "Parent 4"
      },
      {
        text: "Parent 5"
      }
    ];

    var data = [
        {
            name: 'node11',
            children: [
                { name: 'child1' },
                { name: 'child2' }
            ]
        },
        {
            name: 'node22',
            children: [
                { name: 'child3' }
            ]
        }
    ];
    //alert('x is ' + x);
    $('#test1').treeview({data: tree, levels: 3});
    console.log( "tree is !" + tree)
    //$('#test1').tree({data: data});
    //$('#test1').text("this is testing");

});
