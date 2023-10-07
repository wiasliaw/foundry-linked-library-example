// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@zk-kit/incremental-merkle-tree.sol/IncrementalBinaryTree.sol";

// Example is from `https://github.com/privacy-scaling-explorations/zk-kit/blob/main/packages/incremental-merkle-tree.sol/contracts/README.md`
contract Example {
    using IncrementalBinaryTree for IncrementalTreeData;

    uint256 public constant depth = 4;
    IncrementalTreeData public tree;

    event TreeCreated(uint256 depth);
    event LeafInserted(uint256 leaf, uint256 root);
    event LeafUpdated(uint256 leaf, uint256 root);
    event LeafRemoved(uint256 leaf, uint256 root);

    constructor() {
        tree.init(depth, 0);
        emit TreeCreated(depth);
    }

    function root() external view returns (bytes32) {
        return bytes32(tree.root);
    }

    function insert(uint256 _leaf) external {
        tree.insert(_leaf);
        emit LeafInserted(_leaf, tree.root);
    }

    function update(
        uint256 _leaf,
        uint256 _newLeaf,
        uint256[] calldata _proofSiblings,
        uint8[] calldata _proofPathIndices
    ) external {
        tree.update(_leaf, _newLeaf, _proofSiblings, _proofPathIndices);
        emit LeafUpdated(_newLeaf, tree.root);
    }

    function remove(
        uint256 _leaf,
        uint256[] calldata _proofSiblings,
        uint8[] calldata _proofPathIndices
    ) external {
        tree.remove(_leaf, _proofSiblings, _proofPathIndices);
        emit LeafRemoved(_leaf, tree.root);
    }
}
