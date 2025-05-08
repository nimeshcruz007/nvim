local ls = require("luasnip")



local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

-- TypeScript React snippets (for .tsx files)
ls.add_snippets("typescriptreact", {
    -- React Functional Component
    s("rfc", fmt([[
  import React from 'react';

  interface {}Props {{
    {}
  }}

  const {}: React.FC<{}Props> = ({}) => {{
    return (
      <div>
        {}
      </div>
    );
  }};

  export default {};
  ]], {
        i(1, "Component"),
        i(2, "// props"),
        i(1, "Component"),
        i(1, "Component"),
        i(3, "props"),
        i(4, "// content"),
        i(1, "Component"),
    })),

    -- React Functional Component with useState
    s("rfcs", fmt([[
  import React, {{ useState }} from 'react';

  interface {}Props {{
    {}
  }}

  const {}: React.FC<{}Props> = ({}) => {{
    const [state, setState] = useState({});

    return (
      <div>
        {}
      </div>
    );
  }};

  export default {};
  ]], {
        i(1, "Component"),
        i(2, "// props"),
        i(1, "Component"),
        i(1, "Component"),
        i(3, "props"),
        i(4, "initialState"),
        i(5, "// content"),
        i(1, "Component"),
    })),

    -- React Functional Component with useEffect
    s("rfce", fmt([[
  import React, {{ useEffect }} from 'react';

  interface {}Props {{
    {}
  }}

  const {}: React.FC<{}Props> = ({}) => {{
    useEffect(() => {{
      {}

      return () => {{
        {}
      }};
    }}, [{}]);

    return (
      <div>
        {}
      </div>
    );
  }};

  export default {};
  ]], {
        i(1, "Component"),
        i(2, "// props"),
        i(1, "Component"),
        i(1, "Component"),
        i(3, "props"),
        i(4, "// effect"),
        i(5, "// cleanup"),
        i(6, "// dependencies"),
        i(7, "// content"),
        i(1, "Component"),
    })),

    -- React Hook
    s("hook", fmt([[
  import {{ useState, useEffect }} from 'react';

  interface {}Options {{
    {}
  }}

  export const use{} = ({}): {} => {{
    const [state, setState] = useState({});

    useEffect(() => {{
      {}

      return () => {{
        {}
      }};
    }}, [{}]);

    return {};
  }};
  ]], {
        i(1, "Hook"),
        i(2, "// options"),
        i(1, "Hook"),
        i(3, "options"),
        i(4, "ReturnType"),
        i(5, "initialState"),
        i(6, "// effect"),
        i(7, "// cleanup"),
        i(8, "// dependencies"),
        i(9, "state"),
    })),

    -- JSX Fragment
    s("frag", fmt([[
  <>
    {}
  </>
  ]], {
        i(1, "// content"),
    })),

    -- useState Hook
    s("useState", fmt([[
  const [{}, set{}] = useState({});
  ]], {
        i(1, "state"),
        f(function(args)
            return args[1][1]:gsub("^%l", string.upper)
        end, { 1 }),
        i(2, "initialState"),
    })),

    -- useEffect Hook
    s("useEffect", fmt([[
  useEffect(() => {{
    {}

    return () => {{
      {}
    }};
  }}, [{}]);
  ]], {
        i(1, "// effect"),
        i(2, "// cleanup"),
        i(3, "// dependencies"),
    })),
})





vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end)

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)
